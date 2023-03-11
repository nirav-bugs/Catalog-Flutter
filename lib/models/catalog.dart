// class CatalogModel {
//   static final items = [];
// }

// class Item {
//   final int id;
//   final String name;
//   final String desc;
//   final num price;
//   final String color;
//   final String image;

//   Item(
//       {required this.id,
//       required this.name,
//       required this.desc,
//       required this.price,
//       required this.color,
//       required this.image});
// }

class catalogModel {
  int? id;
  String? name;
  String? desc;
  num? price;
  String? color;
  String? image;

  catalogModel(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  catalogModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    desc = json["desc"];
    price = json["price"];
    color = json["color"];
    image = json["image"];
  }
}
