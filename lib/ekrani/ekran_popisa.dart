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
  final _removed = <String>{};
  final _pinned = <String>{};

  @override
  
  void initState(){
    super.initState();
    _posts = _service.dohvatiPostove();
  }

  Future<void> reload() {
    setState(() {
      _posts = _service.dohvatiPostove();
    });
    return _posts;
  }

  void _openDetail(Post post) {
    Navigator.push(
      context, 
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition (opacity: animation, child: child,),
        pageBuilder: (context, animation, secondaryAnimation) => EkranDetalja(post: post),
      ),
    );
  }

  Widget build(BuildContext context) {
    return const Placeholder();
  }
}