class Ingredient {
  final int id;
  final int shopId;
  final String name;
  final double price;
  final String category;

  Ingredient(this.id, this.shopId, this.name, this.price, this.category);

  Ingredient.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        shopId = json['shopId'],
        name = json['name'],
        price = double.parse(json['price']),
        category = json['category'];
}
