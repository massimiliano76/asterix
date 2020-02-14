import 'package:asterix/models/Products/CartProduct.dart';
import 'package:asterix/redux/actions/Cart/cart_actions.dart';
import 'package:asterix/redux/store/AppState.dart';

AppState cartReducer(AppState prevState, dynamic action) {
  switch (action.type) {
    case CartActions.AddProduct:
      AppState newState = prevState;
      CartProduct product = action.payload as CartProduct;

      newState.cart.addProduct(product);
      print(newState.cart.toString());
      return newState;
    case CartActions.RemoveProduct:
      AppState newState = prevState;
      CartProduct product = action.payload as CartProduct;

      newState.cart.removeProduct(product);
      return newState;
    case CartActions.SelectProduct:
      AppState newState = prevState;
      CartProduct product = action.payload as CartProduct;

      newState.currentlySelected = product;
      return newState;
  }

  return prevState;
}
