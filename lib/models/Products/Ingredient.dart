class Ingredient {
  final int id;
  final int shopId;
  final String name;
  final double price;
  final String category;
  final bool isAddon;

  Ingredient(
    this.id,
    this.shopId,
    this.name,
    this.price,
    this.category,
    this.isAddon,
  );

  Ingredient.fromJson(Map<String, dynamic> json, this.isAddon)
      : id = json['id'],
        shopId = json['shop_id'],
        name = json['name'],
        price = double.parse(json['price'].toString()),
        category = json['category'];

  @override
  String toString() {
    return "$id: $shopId, $name, $price, $category";
  }

  bool isEqual(Ingredient compare) {
    if (id == compare.id &&
        shopId == compare.shopId &&
        name == compare.name &&
        price == compare.price &&
        category == compare.category) return true;
    return false;
  }
}
