import 'package:asterix/api/make_request.dart';
import 'package:asterix/models/Local/DataWrapper.dart';
import 'package:asterix/models/Local/LocalInfo.dart';
import 'package:asterix/models/Products/Ingredient.dart';
import 'package:asterix/models/Products/Product.dart';

class CategoryNetwork {
  static getProducts() async {
    try {
      dynamic decodedJson = await MakeRequest.get("modules/menu");
      List products = decodedJson['data'];

      Map<String, List<Product>> storeProducts = {};
      products.forEach((product) {
        Product newProduct = Product.fromJson(product);
        //if category doesn't already exists
        if (!storeProducts.containsKey(newProduct.category)) {
          //create field with category name as key
          storeProducts[newProduct.category] = [];
          storeProducts[newProduct.category].add(newProduct);
        } else {
          //add new product to relative category
          storeProducts[newProduct.category].add(newProduct);
        }
      });
      return storeProducts;
    } catch (e) {
      print(e);
    }
  }

  static Future<DataWrapper> getAddons() async {
    dynamic decodedJson = await MakeRequest.get("whoami");
    LocalInfo localInfo = LocalInfo.fromJson(decodedJson);
    List jsonAddons = decodedJson['ingredients'];
    List<Ingredient> addons = jsonAddons.map<Ingredient>(
      (el) {
        print(el);
        return Ingredient.fromJson(el);
      },
    ).toList();
    DataWrapper dataWrapper = DataWrapper(localInfo, addons);
    return dataWrapper;
  }
}
