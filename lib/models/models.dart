class Category {
  final String idCategory;
  final String strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;

  Category({required this.idCategory, required this.strCategory, required this.strCategoryThumb, required this.strCategoryDescription});

  Category.fromJson(Map<String, dynamic> data)
    : idCategory = data['idCategory'],
      strCategory = data['strCategory'],
      strCategoryThumb = data['strCategoryThumb'],
      strCategoryDescription = data['strCategoryDescription'];

  Map<String, dynamic> toJson() => {'idCategory': idCategory, 'strCategory': strCategory, 'strCategoryThumb': strCategoryThumb, 'strCategoryDescription': strCategoryDescription};
}

class Meal {
  String idMeal;
  String strMeal;
  String strMealThumb;

  final String? strCategory;
  final String? strMealAlternate;
  final String? strArea;
  final String? strInstructions;
  final String? strTags;
  final String? strYoutube;
  final List<String?> ingredients;
  final List<String?> measures;
  final String? strSource;
  final String? strImageSource;
  final String? strCreativeCommonsConfirmed;
  final DateTime? dateModified;

  Meal({
    required this.idMeal, 
    required this.strMeal, 
    required this.strMealThumb,
    this.strCategory, 
    this.strMealAlternate, 
    this.strArea, 
    this.strInstructions, 
    this.strTags, 
    this.strYoutube, 
    this.strSource, 
    this.strImageSource, 
    this.strCreativeCommonsConfirmed, 
    this.dateModified,
    required this.ingredients,
    required this.measures,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    List<String?> ings = List.generate(20, (i) => json["strIngredient${i + 1}"]);

    List<String?> measures = List.generate(20, (i) => json["strMeasure${i + 1}"]);

    return Meal(
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
      strCategory: json['strCategory'],
      strMealAlternate: json['strMealAlternate'],
      strArea: json['strArea'],
      strInstructions: json['strInstructions'],
      strTags: json['strTags'],
      strYoutube: json['strYoutube'],
      strSource: json['strSource'],
      strImageSource: json['strImageSource'],
      strCreativeCommonsConfirmed: json['strCreativeCommonsConfirmed'],
      dateModified: json['dateModified'] != null
        ? DateTime.parse(json['dateModified'])
        : null,
      ingredients: ings,
      measures: measures
    );
  }

  Map<String, dynamic> toJson() => {'idMeal': idMeal, 'strMeal': strMeal, 'strMealThumb': strMealThumb};
}