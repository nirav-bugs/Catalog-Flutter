// import "dart:developer";
// import "../widgets/ItemWidget.dart";

import "dart:convert";
import "package:flutter/material.dart";
import "package:myfirstproject/models/catalog.dart";
import "../widgets/drawer.dart";
import "package:flutter/services.dart" as rootBundle;

class HomePage extends StatelessWidget {
  // final dummyList = List.generate(50, (index) => CatalogModel.Items[0]);

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
      // body: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: ListView.builder(
      //       itemCount: CatalogModel.items.length,
      //       itemBuilder: (context, index) {
      //         return ItemWidget(
      //           item: CatalogModel.items[index],
      //         );
      //       }),
      // ),
      body: FutureBuilder(
          future: ReadJsonData(),
          builder: (index, data) {
            if (data.hasError) {
              return Text("${data.error}");
            }
            // if (data.hasData) {
            //   var items = data.data as List<catalogModel>;
            //   return ListView.builder(
            //       itemCount: items.length,
            //       itemBuilder: (context, index) {
            //         return Card(
            //           child: ListTile(
            //             leading: Image.network(items[index].image.toString()),
            //             title: Text(items[index].name.toString()),
            //             subtitle: Text(items[index].desc.toString()),
            //             trailing: Text(
            //               "\$${items[index].price.toString()}",
            //               style: const TextStyle(
            //                 color: Colors.deepPurple,
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             ),
            //           ),
            //         );
            //       });
            // }
            if (data.hasData) {
              var items = data.data as List<catalogModel>;
              return GridView.builder(
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 17,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: GridTile(
                        header: Text(items[index].name.toString()),
                        child: Image.network(items[index].image.toString()),
                        footer: Text(items[index].price.toString()),
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      drawer: const MyDrawer(),
    );
  }
}

Future<List<catalogModel>> ReadJsonData() async {
  final jsondata =
      await rootBundle.rootBundle.loadString("assets/files/catalog.json");
  final list = json.decode(jsondata) as List<dynamic>;
  return list.map((e) => catalogModel.fromJson(e)).toList();
}
