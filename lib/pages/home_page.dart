import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myfirstproject/widgets/themes.dart';
import 'dart:convert';

import '../models/catalog.dart';
// import '../widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Nirav Bugs";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogueJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogueJson);
    var productsData = decodedData["products"];
    CatalogueModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CatalogHeader(),
                if (CatalogueModel.items != null &&
                    CatalogueModel.items!.isNotEmpty)
                  const CatalogList().expand()
                else
                  const Center(
                    child: CircularProgressIndicator(),
                  )
              ]),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      "Catalog App".text.xl5.bold.color(MyTheme.darkBluish).make(),
      "Trending Products".text.xl2.make()
    ]);
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogueModel.items?.length,
        itemBuilder: (context, index) {
          final catalog = CatalogueModel.items![index];
          return CatalogItem(catalog: catalog);
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({super.key, required this.catalog});
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(
          image: catalog.image,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(MyTheme.darkBluish).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.mH4,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBluish),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "buy".text.make())
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).white.rounded.square(150).py16.make();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(MyTheme.creamColor)
        .make()
        .p16()
        .w40(context);
  }
}







// import "dart:convert";
// // import "dart:html";
// import "package:flutter/material.dart";
// import "package:myfirstproject/models/catalog.dart";
// // import "package:myfirstproject/widgets/themes.dart";
// import "package:velocity_x/velocity_x.dart";
// // import "../widgets/drawer.dart";
// import "package:flutter/services.dart" as rootBundle;

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var idk = "flutter";
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           padding: const EdgeInsets.all(32),
//           child: Column(
//             children: const [
//               Header(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Header extends StatelessWidget {
//   const Header({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         "Catalog App".text.xl4.bold.color(Colors.deepPurple).make(),
//         "Trending Products".text.xl2.bold.color(Colors.deepPurple).make(),
//       ],
//     );
//   }
// }

// Future<List<catalogModel>> ReadJsonData() async {
//   final jsondata =
//       await rootBundle.rootBundle.loadString("assets/files/catalog.json");
//   final list = json.decode(jsondata) as List<dynamic>;
//   return list.map((e) => catalogModel.fromJson(e)).toList();
// }
