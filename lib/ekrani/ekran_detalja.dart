import 'package:flutter/material.dart';
import '../modeli/post.dart';

class EkranDetalja extends StatefulWidget {
  final Post post;
  const EkranDetalja({super.key, required this.post});

  @override
  State<EkranDetalja> createState() => _EkranDetaljaState();
}

class _EkranDetaljaState extends State<EkranDetalja> with SingleTickerProviderStateMixin {
  late final AnimationController _pulse;
  late final Animation<double> _scale;
  
  @override
  initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _scale = Tween<double>(begin: 1, end: 1.2).animate(
      CurvedAnimation(parent: _pulse, curve: Curves.easeInOut)
    );
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
                child: Text(post.body, style: Theme.of(context).textTheme.bodyLarge),
              ),
            ),
          ),
        ],
      ),
    );
  }
}