import 'package:flutter/material.dart';
import 'package:myfirstproject/models/cart.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myfirstproject/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
          backgroundColor: Colors.transparent, title: "Cart".text.make()),
      body: Column(
        children: [
          _cardlist().p32().expand(),
          const Divider(),
          const _cartTotal(),
        ],
      ),
    );
  }
}

class _cartTotal extends StatelessWidget {
  const _cartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$${_cart.totalprice}".text.xl5.color(Colors.black).make(),
          30.widthBox,
          ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MyTheme.darkBluish)),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "Buying not supported yet".text.make()));
                  },
                  child: "BUY".text.white.make())
              .w32(context)
        ],
      ),
    );
  }
}

class _cardlist extends StatefulWidget {
  // const _cardlist({super.key});

  @override
  State<_cardlist> createState() => __cardlistState();
}

class __cardlistState extends State<_cardlist> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _cart.items.length,
        itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              // trailing: IconButton(
              //   icon: Icon(Icons.remove_circle_outline),
              //   onPressed: () {},
              // ),
              trailing: Icon(Icons.remove_circle_outline),
              title: _cart.items[index].name.text.make(),
            ));
  }
}
