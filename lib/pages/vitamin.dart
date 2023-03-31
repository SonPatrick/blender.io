import 'package:animate_do/animate_do.dart';
import 'package:blender/pages/detail.dart';
import 'package:blender/pages/vitamin/fruit_model.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import './vitamin/repository.dart' as repo;

@immutable
class Vitamin extends StatefulWidget {
  const Vitamin({super.key});

  @override
  State<Vitamin> createState() => _VitaminState();
}

class _VitaminState extends State<Vitamin> with TickerProviderStateMixin {
  final List<Fruit> _items = repo.fruits;
  final List<Customer> _people = [
    Customer(
      name: 'Makayla',
      imageProvider: const NetworkImage('https://flutter'
          '.dev/docs/cookbook/img-files/effects/split-check/Avatar1.jpg'),
    ),
  ];

  final GlobalKey _draggableKey = GlobalKey();

  void _itemDroppedOnFruitCart({
    required Fruit item,
    required Customer customer,
  }) {
    setState(() {
      customer.items.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        iconTheme: const IconThemeData(color: Color(0xFFF64209)),
        title: Text(
          'Vitamina',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 32,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(15.0),
                    itemCount: _items.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 7.0,
                      );
                    },
                    itemBuilder: (context, index) {
                      final item = _items[index];
                      return FadeInRight(
                        duration: Duration(milliseconds: 120 + (50 * index)),
                        delay: Duration(milliseconds: 120 + (50 * index)),
                        manualTrigger: false,
                        child: LongPressDraggable<Fruit>(
                          data: item,
                          dragAnchorStrategy: pointerDragAnchorStrategy,
                          feedback: DraggingListItem(
                            dragKey: _draggableKey,
                            photoProvider: item.imageProvider,
                          ),
                          child: MenuListItem(
                            name: item.name,
                            price: item.formattedTotalItemPrice,
                            photoProvider: item.imageProvider,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Row(
        children: _people.map(_buildPersonWithDropZone).toList(),
      ),
    );
  }

  Widget _buildPersonWithDropZone(Customer customer) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Details()));
          },
          child: DragTarget<Fruit>(
            builder: (context, candidateItems, rejectedItems) {
              return FruitCart(
                hasItems: customer.items.isNotEmpty,
                highlighted: candidateItems.isNotEmpty,
                customer: customer,
              );
            },
            onAccept: (item) {
              _itemDroppedOnFruitCart(
                item: item,
                customer: customer,
              );
            },
          ),
        ),
      ),
    );
  }
}

class FruitCart extends StatelessWidget {
  const FruitCart({
    super.key,
    required this.customer,
    this.highlighted = false,
    this.hasItems = false,
  });

  final Customer customer;
  final bool highlighted;
  final bool hasItems;

  @override
  Widget build(BuildContext context) {
    final textColor = highlighted ? Colors.white : Colors.black;

    return Transform.scale(
      scale: highlighted ? 1.0 : 1.0,
      child: Material(
        //elevation: highlighted ? 3.0 : 0.0,
        //borderRadius: BorderRadius.circular(22.0),
        color: highlighted ? Colors.orange : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5.0,
            vertical: 5.0,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 2,
                right: 5,
                child: TextButton(
                  child: const Text("Limpar"),
                  onPressed: () {},
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 50,
                    child: Icon(
                      LineIcons.blender,
                      size: 50,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    "segure e arraste as frutas para cá",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: textColor,
                          fontWeight: hasItems ? FontWeight.normal : FontWeight.bold,
                        ),
                  ),
                  Visibility(
                    visible: hasItems,
                    maintainState: true,
                    maintainAnimation: true,
                    maintainSize: true,
                    child: Column(
                      children: [
                        const SizedBox(height: 4.0),
                        Text(
                          '${customer.items.length} fruta${customer.items.length > 1 ? 's' : ''}',
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MenuListItem extends StatelessWidget {
  const MenuListItem({
    super.key,
    this.name = '',
    this.price = '',
    required this.photoProvider,
    this.isDepressed = false,
  });

  final String name;
  final String price;
  final ImageProvider photoProvider;
  final bool isDepressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: SizedBox(
                width: 70,
                height: 70,
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeInOut,
                    height: isDepressed ? 115 : 120,
                    width: isDepressed ? 115 : 120,
                    child: Image(
                      image: photoProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 30.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 18.0,
                        ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    price,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DraggingListItem extends StatelessWidget {
  const DraggingListItem({
    super.key,
    required this.dragKey,
    required this.photoProvider,
  });

  final GlobalKey dragKey;
  final ImageProvider photoProvider;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: const Offset(-0.5, -0.5),
      child: ClipRRect(
        key: dragKey,
        borderRadius: BorderRadius.circular(12.0),
        child: SizedBox(
          height: 100,
          width: 100,
          child: Opacity(
            opacity: 0.85,
            child: Image(
              image: photoProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class Customer {
  Customer({
    required this.name,
    required this.imageProvider,
    List<Fruit>? items,
  }) : items = items ?? [];

  final String name;
  final ImageProvider imageProvider;
  final List<Fruit> items;

  String get formattedTotalItemPrice {
    final totalPriceCents = items.fold<int>(0, (prev, item) => prev + item.totalPriceCents);
    return '\$${(totalPriceCents / 100.0).toStringAsFixed(2)}';
  }
}
