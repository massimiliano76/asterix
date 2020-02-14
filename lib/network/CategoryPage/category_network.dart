import 'package:asterix/api/make_request.dart';
import 'package:asterix/models/Products/Product.dart';

class CategoryNetwork {
  static getProducts() async {
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
        storeProducts[newProduct.category].add(newProduct);
      }
    });
    return storeProducts;
  }
}
