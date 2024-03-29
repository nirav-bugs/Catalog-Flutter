import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myfirstproject/utlis/routes.dart';
import 'package:myfirstproject/widgets/themes.dart';
import 'dart:convert';

import '../models/catalog.dart';
// import '../widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyTheme.darkBluish,
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.cartRoute);
        },
        child: const Icon(CupertinoIcons.cart),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CatalogHeader(),
                if (CatalogueModel.items != null &&
                    CatalogueModel.items!.isNotEmpty)
                  const CatalogList().pOnly(top: 16).expand()
                else
                  const CircularProgressIndicator().centered().expand(),
              ]),
        ),
      ),
    );
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
