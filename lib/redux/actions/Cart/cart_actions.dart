import 'package:asterix/models/Products/CartProduct.dart';

enum CartActions {
  RemoveProduct,
  AddProduct,
  SelectProduct,
}

class RemoveProduct {
  CartProduct payload;
  CartActions type = CartActions.RemoveProduct;

  RemoveProduct(this.payload);
}

class SelectProduct {
  CartProduct payload;
  CartActions type = CartActions.SelectProduct;

  SelectProduct(this.payload);
}

class AddProduct {
  CartProduct payload;
  CartActions type = CartActions.AddProduct;

  AddProduct(this.payload);
}
