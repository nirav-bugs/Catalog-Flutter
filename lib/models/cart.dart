import 'package:myfirstproject/models/catalog.dart';

class CartModel {
  // static final cartModel = CartModel._internal();
  // CartModel._internal();

  // factory CartModel() => cartModel;

  // catalog fields
  CatalogueModel? catalog;

// collections of id -store id of each items
  final List<int> _itemsids = [];

  // CatalogueModel? get  catalog => _catalog;

  // set catalog(CatalogueModel newCatalog) {
  //   assert(newCatalog != null);
  //   _catalog = newCatalog;
  // }

  // get itema in cart

  List<Item> get items => _itemsids.map((id) => catalog!.getbyid(id)).toList();

// totalprice
  num get totalprice =>
      items.fold(0, (total, current) => total + current.price);

// add item

  void add(Item item) {
    _itemsids.add(item.id);
  }

  // remove item
  void remove(Item item) {
    _itemsids.remove(item.id);
  }
}
