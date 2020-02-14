import 'package:asterix/models/Products/CartProduct.dart';
import 'package:asterix/redux/actions/Cart/cart_actions.dart';
import 'package:asterix/redux/store/AppState.dart';

AppState cartReducer(AppState prevState, dynamic action) {
  CartActions type = action.type as CartActions;
  CartProduct product = action.payload as CartProduct;
  switch (type) {
    case CartActions.AddProduct:
      AppState newState = prevState;
      newState.cart.addProduct(product);
      print(newState.cart.toString());
      return newState;
    case CartActions.RemoveProduct:
      AppState newState = prevState;
      newState.cart.removeProduct(product);
      return newState;
    case CartActions.SelectProduct:
      AppState newState = prevState;
      newState.currentlySelected = product;
      return newState;
  }

  return prevState;
}
