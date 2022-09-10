import 'package:flutter/material.dart';
import 'package:blender/models/fruit.dart';

class Detail extends StatefulWidget {
  final List<Fruit> frutas;
  const Detail({Key? key, required this.frutas}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final _vitaminas = StringBuffer();

  void _listVitaminas() {
    setState(() {
      for (var vitamina in widget.frutas) {
        _vitaminas.write(vitamina.vitamina);
      }
    });
  }

  @override
  void initState() {
    if (mounted) _listVitaminas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: (widget.frutas.isNotEmpty)
            ? Column(
                children: [
                  Text(_vitaminas.toString()),
                ],
              )
            : const Center(child: Text("Nenhuma fruta selecionada.")),
      ),
    );
  }
}
