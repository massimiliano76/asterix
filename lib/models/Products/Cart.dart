import 'package:asterix/models/Products/CartProduct.dart';

class Cart {
  final List<CartProduct> products = [];
  double totalPrice = 0.00;
  int totalProduct = 0;

  addProduct(CartProduct newProduct) {
    products.add(newProduct);
    totalPrice += newProduct.product.price;
    totalProduct++;
  }

  removeProduct(CartProduct removeProduct) {
    if (totalProduct != 0) {
      products.remove(removeProduct);
      totalPrice -= removeProduct.product.price;
      totalProduct--;
    }
  }

  @override
  String toString() {
    return products.toString();
  }
}
