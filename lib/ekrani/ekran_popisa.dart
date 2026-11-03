import 'package:flutter/material.dart';
import '../modeli/post.dart';
import '../usluge/post_servis.dart';
import '../widgeti/post_widget.dart';
import 'ekran_detalja.dart';

class EkranPopisa extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Popis')),
      body: const Center(child: Text('Ovdje će biti popis stavki.')),
    );

  }
}