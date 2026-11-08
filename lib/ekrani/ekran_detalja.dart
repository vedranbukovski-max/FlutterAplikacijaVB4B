import 'package:flutter/material.dart';
import '../modeli/post.dart';
import '../widgeti/oznaka_widget.dart';

class EkranDetalja extends StatefulWidget {
  final Post post;
  const EkranDetalja({super.key, required this.post});

  @override
  State<EkranDetalja> createState() => _EkranDetaljaState();
}

class _EkranDetaljaState extends State<EkranDetalja>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _scale = Tween<double>(
      begin: 1.0,
      end: 1.15,
    ).animate(CurvedAnimation(parent: _pulse, curve: Curves.easeInOut));
  }

  @override
  dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.post;
    return Scaffold(
      appBar: AppBar(title: Text(post.title)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: ScaleTransition(
              scale: _scale,
              child: Hero(
                tag: post.id,
                child: OznakaWidget(id: post.id, velicina: 100),
              ),
            ),
          ),
          const SizedBox(height: 32),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text('Identifikator korisnika:'),
            trailing: Text(post.userId.toString()),
          ),
          ListTile(
            leading: const Icon(Icons.title),
            title: Text('Naslov posta:'),
            trailing: Text(post.title),
          ),
          ListTile(
            leading: const Icon(Icons.content_paste),
            title: Text('Sadržaj posta:'),
            trailing: Text(post.body),
          ),
        ],
      ),
    );
  }
}