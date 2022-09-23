import 'package:flutter/material.dart';
import 'package:blender/models/fruit.dart';

class CardFruit extends StatefulWidget {
  final Fruit fruit;
  final double? width;
  final double? height;
  final double? size;
  const CardFruit(
      {Key? key,
      this.width = 100,
      this.height = 100,
      required this.fruit,
      this.size = 50})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CardFruitState createState() => _CardFruitState();
}

class _CardFruitState extends State<CardFruit> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.standard,
      leading: Image.asset(widget.fruit.image,
          fit: BoxFit.cover, height: widget.size, width: widget.size),
      title: Text(
        widget.fruit.nome,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      subtitle: Text(
        widget.fruit.vitamina,
        maxLines: 2,
      ),
    );
  }
}
