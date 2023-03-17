import 'package:myfirstproject/models/cart.dart';
import 'package:myfirstproject/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  CatalogueModel? catalog;
  CartModel? cart;

  MyStore() {
    catalog = CatalogueModel();
    cart = CartModel();
    cart!.catalog = catalog;
  }
}
