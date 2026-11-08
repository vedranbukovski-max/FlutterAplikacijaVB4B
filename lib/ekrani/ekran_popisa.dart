import 'package:flutter/material.dart';
import '../modeli/post.dart';
import '../usluge/post_servis.dart';
import '../widgeti/post_widget.dart';
import 'ekran_detalja.dart';

class EkranPopisa extends StatefulWidget {
  const EkranPopisa({super.key});

  @override
  State<EkranPopisa> createState() => _EkranPopisaState();
}

class _EkranPopisaState extends State<EkranPopisa> {
  final _service = const ServisPostova();
  late Future<List<Post>> _posts;
  final _removed = <int>{};
  final _pinned = <int>{};

  @override
  void initState() {
    super.initState();
    _posts = _service.dohvatiPostove();
  }
  Future<void> _reload() {
    setState(() {
      _posts = _service.dohvatiPostove();
    });
    return _posts;
  }
  void _openDetail(Post post) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (context, animation, secondaryAnimation) =>
            EkranDetalja(post: post),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
        
      ),
    );
  }
  void _togglePin(Post post) {
    setState(() {
      if (!_pinned.remove(post.id)) {
        _pinned.add(post.id);
      }
    });
  }
  void _removePost(Post post) {
    setState(() {
      _removed.add(post.id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Post "${post.title}" je uklonjen.'),
        action: SnackBarAction(
          label: 'Poništi',
          onPressed: () {
            setState(() {
              _removed.remove(post.id);
            });
          },
        ),
      ),
    );
  }

  Widget _buildList(List<Post> posts) {
    final visible = posts.where((p) => !_removed.contains(p.id)).toList();
    if (visible.isEmpty) {
      return const Center(child: Text('Nema postova za prikaz.'));
    }
    return RefreshIndicator(
      onRefresh: _reload,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: visible.length,
        itemBuilder: (context, index) {
          final post = visible[index];
          return PostWidget(
            post: post,
            pinned: _pinned.contains(post.id),
            onTap: () => _openDetail(post),
            onLongPress: () => _togglePin(post),
            onDismissed: () => _removePost(post),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Popis postova')),
      body: FutureBuilder<List<Post>>(
        future: _posts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              !snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.wifi_off, size: 48),
                  const SizedBox(height: 12),
                  const Text('Provjeri internetsku vezu i pokušaj ponovno.'),
                  const SizedBox(height: 12),
                  FilledButton(
                    onPressed: _reload,
                    child: const Text('Pokušaj ponovno'),
                  ),
                ],
              ),
            );
          }
          return _buildList(snapshot.data!);
        },
      ),
    );
  }
}