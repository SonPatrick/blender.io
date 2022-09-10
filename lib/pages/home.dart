import 'package:flutter/material.dart';
import 'package:blender/pages/start.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Start(),
    Container(color: Colors.orange),
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
              icon: Icon(LineIcons.fruitApple), label: "Frutas"),
          BottomNavigationBarItem(
              icon: Icon(LineIcons.carrot), label: "Legumes"),
          BottomNavigationBarItem(icon: Icon(LineIcons.info), label: "Sobre"),
        ],
      ),
    );
  }
}
