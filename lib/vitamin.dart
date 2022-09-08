import 'package:flutter/material.dart';

class Vitamin extends StatefulWidget {
  const Vitamin({super.key});

  @override
  State<Vitamin> createState() => _VitaminState();
}

class _VitaminState extends State<Vitamin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vitamina"),
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: Container(color: Colors.amber),
    );
  }
}
