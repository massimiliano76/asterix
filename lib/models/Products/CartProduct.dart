import 'package:asterix/models/Products/Ingredient.dart';
import 'package:asterix/models/Products/Product.dart';

class CartProduct {
  final Product product;
  int quantity;
  double finalPrice;
  List<Ingredient> ingredients;
  String ingredientsText;

  CartProduct(this.product)
      : ingredients = List.from(product.ingredients),
        ingredientsText = listToString(product.ingredients),
        finalPrice = product.price,
        quantity = 1;

  incrementQuantity() {
    quantity++;
    finalPrice = product.price * quantity;
  }

  decrementQuantity() {
    if (quantity != 1) {
      finalPrice -= product.price;
      quantity--;
    }
  }

  addIngredient(Ingredient newIng) {
    this.ingredients = [...ingredients, newIng];
    ingredientsText = listToString(ingredients);
  }

  removeIngredient(Ingredient removeIng) {
    ingredients.remove(removeIng);
    ingredientsText = listToString(ingredients);
  }

  @override
  String toString() {
    String data =
        "${product.id}: ${product.name} ${product.price.toStringAsFixed(2)} €";
    return data;
  }
}

listToString(List<Ingredient> ingredients) {
  StringBuffer ing = StringBuffer();
  if (ingredients.isNotEmpty) {
    ingredients.forEach((Ingredient el) {
      ing.write("${el.name.trim()}, ");
    });
    return removeLastComma(ing);
  } else {
    ing.write("");
    return ing;
  }
}

String removeLastComma(StringBuffer string) {
  String toString = string.toString();
  final startIndex = (toString.length - 2);
  final replaced = toString.replaceFirst(RegExp(','), '', startIndex);
  return replaced;
}
