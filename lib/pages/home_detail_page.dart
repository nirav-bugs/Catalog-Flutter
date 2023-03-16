import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myfirstproject/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';
import '../widgets/home_widgets/add_to_cart.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: Vx.mH4,
        children: [
          "\$${catalog.price}".text.bold.xl4.color(MyTheme.darkBluish).make(),
          // ElevatedButton(
          //         onPressed: () {},
          //         style: ButtonStyle(
          //             backgroundColor:
          //                 MaterialStateProperty.all(MyTheme.darkBluish),
          //             shape: MaterialStateProperty.all(const StadiumBorder())),
          //         child: "Add to cart".text.make())
          addToCart(
            catalog: catalog,
          ).wh(120, 50)
        ],
      ).wh(150, 56).p20(),
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
                child: VxArc(
              height: 30,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                width: (context.screenWidth),
                color: Colors.white,
                child: Column(children: [
                  catalog.name.text.lg
                      .color(MyTheme.darkBluish)
                      .bold
                      .xl5
                      .make(),
                  catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                  10.heightBox,
                  "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Consequuntur aperiam dolorum ipsum eum eaque suscipit minus quaerat a ducimus aliquam numquam, veritatis commodi doloribus error quisquam enim magni fugiat dolorem veniam dolore aliquid? Id."
                      .text
                      .textStyle(context.captionStyle)
                      .make()
                      .p16()
                ]).py64(),
              ),
            ))
          ],
        ).centered(),
      ),
    );
  }
}
