import 'package:asterix/models/Products/CartProduct.dart';
import 'package:flutter/foundation.dart';

class Cart {
  final List<CartProduct> products = [];
  double totalPrice = 0.00;
  int totalProduct = 0;

  incrementSingleProduct(CartProduct findProduct) {
    int index = products.indexOf(findProduct);
    products[index].incrementQuantity();

    totalPrice += findProduct.singlePrice;
    totalProduct++;
  }

  decrementSingleProduct(CartProduct product) {
    if (product.quantity == 1) {
      products.remove(product);
    } else {
      int index = products.indexOf(product);
      products[index].decrementQuantity();
    }
    totalPrice -= product.singlePrice;
    totalProduct--;
  }

  addProduct(CartProduct newProduct) {
    try {
      //index of the element already present
      int index = products.indexOf(
        products.firstWhere(
          (el) => listEquals(el.ingredients, newProduct.ingredients),
        ),
      );
      products[index].incrementQuantity(newProduct.quantity);
    } catch (e) {
      products.add(newProduct);
    }
    totalPrice += newProduct.finalPrice;
    totalProduct += newProduct.quantity;
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
