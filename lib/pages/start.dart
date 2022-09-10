import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:blender/data/list_fruit.dart';
import 'package:blender/models/fruit.dart';
import 'package:blender/pages/detail.dart';
import 'package:blender/widgets/card_fruit.dart';
import 'package:blender/widgets/custom/badge.dart';
import 'package:line_icons/line_icons.dart';
import 'package:searchfield/searchfield.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _StartState createState() => _StartState();
}

class _StartState extends State<Start>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final TextEditingController _searchCtrl = TextEditingController();
  final ScrollController _controller = ScrollController(keepScrollOffset: true);
  final List<String> _suggestions = [];
  final List<Fruit> _fruits = [];
  final List<Fruit> _fruitsSearch = [];
  final List<Fruit> _added = [];

  Widget randomAnimation({required int index, required Widget child}) {
    return (index % 2 == 0)
        ? FadeInRight(
            duration: Duration(milliseconds: 120 + (50 * index)),
            delay: Duration(milliseconds: 120 + (50 * index)),
            manualTrigger: false,
            child: child,
          )
        : (index % 3 == 0)
            ? FadeInRight(
                duration: Duration(milliseconds: 120 + (50 * index)),
                delay: Duration(milliseconds: 120 + (50 * index)),
                manualTrigger: false,
                child: child,
              )
            : (index % 4 == 0)
                ? FadeInRight(
                    duration: Duration(milliseconds: 120 + (50 * index)),
                    delay: Duration(milliseconds: 120 + (50 * index)),
                    manualTrigger: false,
                    child: child,
                  )
                : FadeInRight(
                    duration: Duration(milliseconds: 120 + (50 * index)),
                    delay: Duration(milliseconds: 120 + (50 * index)),
                    manualTrigger: false,
                    child: child,
                  );
  }

  void _onDismiss(var direction, int index) {
    if (direction == DismissDirection.endToStart) {
      setState(() {
        _added.add(_fruits.elementAt(index));
        _fruits.removeAt(index);
      });
    } else {
      setState(() {
        _fruits.add(_fruits.elementAt(index));
      });
    }
  }

  void getFruitIdByInfo() {
    if (mounted) {
      setState(() {
        _fruitsSearch.clear();

        final index = _fruits.indexWhere(
            (element) => element.nome == _searchCtrl.text.toString());
        if (index >= 0) {
          _fruitsSearch.add(_fruits[index]);
        } else if (_searchCtrl.text.toString().isEmpty ||
            _searchCtrl.text.toString() == "") {
          _fruitsSearch.addAll(fruits);
        }
      });
    }
  }

  void _loadList() {
    setState(() {
      _searchCtrl.clear();
      _fruits.clear();
      _added.clear();
      _fruitsSearch.addAll(fruits);
      _fruits.addAll(fruits);
      for (var element in fruits) {
        _suggestions.add(element.nome);
      }
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    if (mounted) _loadList();
    if (mounted) _searchCtrl.addListener(getFruitIdByInfo);
    super.initState();
  }

  @override
  void dispose() {
    _fruits.clear();
    _fruitsSearch.clear();
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        extendBody: false,
        extendBodyBehindAppBar: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(130.0),
          child: AppBar(
            title: const Text("Blender"),
            centerTitle: true,
            leading: IconButton(
                icon: const Icon(LineIcons.alternateRedo),
                onPressed: _loadList),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => Detail(frutas: _added)),
                    ),
                  );
                },
                icon: Badge(
                  color: Colors.amber,
                  top: 0,
                  right: 0,
                  value: "${_added.length}",
                  child: const Icon(LineIcons.blender, size: 30),
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: SearchField(
                  suggestionAction: SuggestionAction.unfocus,
                  hasOverlay: true,
                  validator: (state) => (!_suggestions.contains(state))
                      ? 'Digite o nome da fruta'
                      : null,
                  controller: _searchCtrl,
                  searchInputDecoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    prefixIcon: const Icon(LineIcons.search),
                    hintText: "Digite o nome da fruta",
                    fillColor: Colors.black.withOpacity(0.04),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.white, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                  ),
                  maxSuggestionsInViewPort: 6,
                  itemHeight: 50,
                  onTap: (value) => getFruitIdByInfo(),
                  suggestions: _suggestions,
                ),
              ),
            ),
          ),
        ),
        body: ListView.separated(
          controller: _controller,
          scrollDirection: Axis.vertical,
          itemCount: _fruitsSearch.length,
          separatorBuilder: (ctx, index) => const Divider(height: 2),
          itemBuilder: (ctx, index) {
            return randomAnimation(
              index: index,
              child: Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.horizontal,
                onDismissed: (direction) => _onDismiss(direction, index),
                secondaryBackground: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20.0),
                  color: Colors.amber,
                  child: const Icon(LineIcons.plus, color: Colors.white),
                ),
                background: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20.0),
                  color: Colors.redAccent,
                  child: const Icon(LineIcons.info, color: Colors.white),
                ),
                child: CardFruit(
                  fruit: _fruitsSearch.elementAt(index),
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
