import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';
import '../themes.dart';

class addToCart extends StatefulWidget {
  final Item catalog;

  const addToCart({
    super.key,
    required this.catalog,
  });

  @override
  State<addToCart> createState() => _addToCartState();
}

class _addToCartState extends State<addToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          isAdded = isAdded.toggle();
          final _catalog = CatalogueModel();
          final _cart = CartModel();
          _cart.add(widget.catalog);
          _cart.catalog = _catalog;
          setState(() {});
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(MyTheme.darkBluish),
            shape: MaterialStateProperty.all(const StadiumBorder())),
        child:
            isAdded ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus));
  }
}
