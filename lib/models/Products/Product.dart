import 'package:asterix/models/Products/Ingredient.dart';

class Product {
  final int id;
  final String name;
  double price;
  final String category;
  final String description;
  final List<Ingredient> ingredients;

  Product(this.id, this.name, this.price, this.category, this.ingredients,
      this.description);

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        price = double.parse(json['price'].toString()),
        category = json['category'],
        description = json['description'],
        ingredients = json['ingredients']
            .map<Ingredient>((el) => Ingredient.fromJson(el, false))
            .toList();
}
