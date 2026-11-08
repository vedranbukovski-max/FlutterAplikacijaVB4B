import 'package:flutter/material.dart';

Color boja(int id) {
  return Colors.blue;
}

class OznakaWidget extends StatelessWidget {
  final int id;
  final double velicina;
  const OznakaWidget({super.key, required this.id, this.velicina = 40});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        width: velicina,
        height: velicina,
        padding: EdgeInsets.all(velicina * 0.25),
        decoration: BoxDecoration(shape: BoxShape.circle, color: boja(id)),
        child: FittedBox(
          child: Text(
            id.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
