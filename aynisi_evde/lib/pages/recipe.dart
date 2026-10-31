class Ingredient {
  final String name;
  final num amount; // int yerine num veya double kullanarak 10.00 gibi ondalıklı tipleri de güvenle alırız
  final String unit;

  const Ingredient({
    required this.name,
    required this.amount,
    required this.unit,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'] as String? ?? '',
      amount: json['amount'] as num? ?? 0, 
      unit: json['unit'] as String? ?? '',
    );
  }
}

class Recipe {
  final int recipeId;
  final String recipeName;
  final String recipeText;
  final List<Ingredient> ingredients;

  const Recipe({
    required this.recipeId,
    required this.recipeName,
    required this.recipeText,
    required this.ingredients,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      recipeId: json['recipe_id'] as int? ?? 0,
      recipeName: json['recipe_name'] as String? ?? 'İsimsiz Tarif',
      recipeText: json['recipe'] as String? ?? '',
      ingredients: (json['ingredients'] as List<dynamic>?)
              ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}