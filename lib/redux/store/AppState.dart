import 'package:asterix/models/Local/LocalInfo.dart';
import 'package:asterix/models/Products/Cart.dart';
import 'package:asterix/models/Products/CartProduct.dart';
import 'package:asterix/models/Products/Ingredient.dart';
import 'package:asterix/models/Products/Product.dart';

class AppState {
  LocalInfo localInfo;

  //dynamic structure
  Map<String, List<Product>> products = {
    //categoryName = <List<Product>>[]
  };

  List<Ingredient> addons = [];

  CartProduct currentlySelected;

  Cart cart = Cart();
}
