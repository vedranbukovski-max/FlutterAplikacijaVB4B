import 'package:flutter/material.dart';
import 'package:flutter_application_1/ekrani/ekran_popisa.dart';

void main() {
  runApp(const UpravljanjePostova());
}

class UpravljanjePostova extends StatelessWidget {
  const UpravljanjePostova({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Upravljanje postovima',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const EkranPopisa(),
    );
  }
}