import 'package:flutter/material.dart';
import 'ekran_popisa.dart';

class PocetniEkran extends StatefulWidget {
  const PocetniEkran({super.key});

  @override
  State<PocetniEkran> createState() => _PocetniEkranState();
}

class _PocetniEkranState extends State<PocetniEkran> {
  int _index = 0;
  static const _ekran = [EkranPopisa()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _ekran[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (index) => setState(() => _index = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.list), label: 'Popis'),
        ],
      ),
    );
  }
}