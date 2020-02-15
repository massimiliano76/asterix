import 'package:asterix/models/Products/Ingredient.dart';
import 'package:asterix/models/Products/Product.dart';

class CartProduct {
  final Product product;
  int quantity;
  double finalPrice;
  double singlePrice;
  double addonsPrice;
  List<Ingredient> ingredients;
  String ingredientsText;

  CartProduct(this.product)
      : ingredients = List.from(product.ingredients),
        ingredientsText = listToString(product.ingredients),
        finalPrice = product.price,
        quantity = 1,
        addonsPrice = 0,
        singlePrice = product.price;

  incrementQuantity([int increase]) {
    quantity += increase ?? 1;
    finalPrice += singlePrice;
  }

  decrementQuantity() {
    if (quantity != 1) {
      finalPrice -= singlePrice;
      quantity--;
    }
  }

  addIngredient(Ingredient newIng) {
    //add to ingredient list
    this.ingredients = [...ingredients, newIng];
    ingredientsText += ", ${newIng.name}";

    //If it is a basic ingredient, do not make any price changes
    if (newIng.isAddon) {
      finalPrice += (newIng.price * quantity);
      addonsPrice += newIng.price;
      singlePrice = product.price + addonsPrice;
    }
  }

  removeIngredient(Ingredient removeIng) {
    ingredients.remove(removeIng);
    ingredientsText = listToString(ingredients);

    //If it is a basic ingredient, do not make any price changes
    if (removeIng.isAddon) {
      finalPrice -= (removeIng.price * quantity);
      addonsPrice -= removeIng.price;
      singlePrice = product.price + addonsPrice;
    }
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
