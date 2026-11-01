import 'package:flutter/material.dart';

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