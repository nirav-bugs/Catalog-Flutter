import 'dart:convert';

class CatalogueModel {
  // static final cartModel = CatalogueModel._internal();
  // CatalogueModel._internal();

  // factory CatalogueModel() => cartModel;
  static List<Item>? items;

  // get items by id
  Item getbyid(int id) =>
      items!.firstWhere((element) => element.id == id, orElse: null);

  // get by positon

  Item getbypos(int pos) => items![pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(this.id, this.name, this.desc, this.price, this.color, this.image);

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? image,
  }) {
    return Item(
      id ?? this.id,
      name ?? this.name,
      desc ?? this.desc,
      price ?? this.price,
      color ?? this.color,
      image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      map['id'],
      map['name'],
      map['desc'],
      map['price'],
      map['color'],
      map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}

// class catalogModel {
//   int? id;
//   String? name;
//   String? desc;
//   num? price;
//   String? color;
//   String? image;

//   catalogModel(
//       {required this.id,
//       required this.name,
//       required this.desc,
//       required this.price,
//       required this.color,
//       required this.image});

//   catalogModel.fromJson(Map<String, dynamic> json) {
//     id = json["id"];
//     name = json["name"];
//     desc = json["desc"];
//     price = json["price"];
//     color = json["color"];
//     image = json["image"];
//   }
// }
