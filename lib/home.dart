import 'package:blender/vitamin.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Vitamin(),
    Container(color: Colors.pink),
    Container(color: Colors.purple),
    Container(color: Colors.green),
  ];

  void _onTap(index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(LineIcons.blender), label: "Vitamina"),
          BottomNavigationBarItem(
              icon: Icon(LineIcons.bookmark), label: "Salvos"),
          BottomNavigationBarItem(
              icon: Icon(LineIcons.fruitApple), label: "Frutas"),
          BottomNavigationBarItem(icon: Icon(LineIcons.user), label: "Perfil"),
        ],
      ),
    );
  }
}
