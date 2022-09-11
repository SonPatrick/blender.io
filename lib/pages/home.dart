// ignore_for_file: library_private_types_in_public_api

import 'package:blender/pages/vitamin.dart';
import 'package:flutter/material.dart';
import 'package:blender/pages/fruits.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Vitamin(),
    const Fruits(),
    Container(color: Colors.indigo),
    Container(color: Colors.indigo),
    Container(color: Colors.indigo),
  ];

  void _ontTap(int index) => setState(() => _selectedIndex = index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _ontTap,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(LineIcons.blender),
            label: "Vitamina",
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.fruitApple),
            label: "Frutas",
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.bookmark),
            label: "Favoritos",
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.hotjar),
            label: "Dicas",
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.user),
            label: "Perfil",
          ),
        ],
      ),
    );
  }
}
