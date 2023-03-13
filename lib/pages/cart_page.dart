import 'package:flutter/material.dart';
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
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$999".text.xl5.color(Colors.black).make(),
          30.widthBox,
          ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MyTheme.darkBluish)),
                  onPressed: () {},
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
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => const ListTile(
              leading: Icon(Icons.done),
              // trailing: IconButton(
              //   icon: Icon(Icons.remove_circle_outline),
              //   onPressed: () {},
              // ),
              trailing: Icon(Icons.remove_circle_outline),
              title: Text("item 1"),
            ));
  }
}
