import 'package:asterix/models/Products/CartProduct.dart';
import 'package:asterix/models/Products/Ingredient.dart';
import 'package:asterix/redux/actions/Product/product_action.dart';
import 'package:asterix/redux/store/AppState.dart';

AppState productReducer(AppState prevState, dynamic action) {
  switch (action.type) {
    case ProductActions.SelectProduct:
      AppState newState = prevState;
      CartProduct newProd = action.payload as CartProduct;

      newState.currentlySelected = newProd;

      return newState;
    case ProductActions.IncCurrentQuantity:
      AppState newState = prevState;

      newState.currentlySelected.incrementQuantity();

      return newState;
    case ProductActions.DecCurrentQuantity:
      AppState newState = prevState;

      newState.currentlySelected.decrementQuantity();

      return newState;
    case ProductActions.AddIngredients:
      AppState newState = prevState;
      Ingredient newIng = action.payload as Ingredient;

      newState.currentlySelected.addIngredient(newIng);

      return newState;

    case ProductActions.RemoveIngredients:
      AppState newState = prevState;
      Ingredient newIng = action.payload as Ingredient;

      newState.currentlySelected.removeIngredient(newIng);

      return newState;
    case ProductActions.IncCartQuantity:
      AppState newState = prevState;
      CartProduct findProduct = action.payload as CartProduct;

      newState.cart.incrementSingleProduct(findProduct);

      return newState;
    case ProductActions.DecCartQuantity:
      AppState newState = prevState;
      CartProduct findProduct = action.payload as CartProduct;

      newState.cart.decrementSingleProduct(findProduct);

      return newState;
  }

  return prevState;
}
