import "package:flutter/material.dart";
import "package:myfirstproject/models/catalog.dart";
import "../widgets/ItemWidget.dart";
import "../widgets/drawer.dart";

class HomePage extends StatelessWidget {
  final dummyList = List.generate(50, (index) => CatalogModel.Items[0]);

  // const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var idk = "flutter";
    return Scaffold(
      appBar: AppBar(
        title: const Text("BUGS app"),
      ),
      // body: Center(
      //   child: Text("Welcome to Bugs first $idk App"),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: dummyList.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                item: dummyList[index],
              );
            }),
      ),
      drawer: const MyDrawer(),
    );
  }
}
