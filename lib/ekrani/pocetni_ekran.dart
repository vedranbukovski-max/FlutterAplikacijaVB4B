import 'package:flutter/material.dart';
import 'ekran_popisa.dart';

class PocetniEkran extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Početni ekran'),
      ),
      body: const Center(
        child: Text('Dobrodošao u aplikaciju!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}