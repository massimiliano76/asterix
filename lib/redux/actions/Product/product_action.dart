import 'package:asterix/models/Products/CartProduct.dart';
import 'package:asterix/models/Products/Ingredient.dart';

enum ProductActions {
  IncCurrentQuantity,
  DecCurrentQuantity,
  AddIngredients,
  RemoveIngredients,
  IncCartQuantity,
  DecCartQuantity,
}

class IncrementQuantity {
  ProductActions type = ProductActions.IncCurrentQuantity;
}

class IncrementCartQuantity {
  final CartProduct payload;
  ProductActions type = ProductActions.IncCartQuantity;

  IncrementCartQuantity(this.payload);
}

class DecrementCartQuantity {
  final CartProduct payload;
  ProductActions type = ProductActions.DecCartQuantity;

  DecrementCartQuantity(this.payload);
}

class DecrementQuantity {
  ProductActions type = ProductActions.DecCurrentQuantity;
}

class AddIngredients {
  Ingredient payload;
  ProductActions type = ProductActions.AddIngredients;

  AddIngredients(this.payload);
}

class RemoveIngredients {
  Ingredient payload;
  ProductActions type = ProductActions.RemoveIngredients;

  RemoveIngredients(this.payload);
}
