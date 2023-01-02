// To parse this JSON data, do
//
//     final categorydrilldown = categorydrilldownFromJson(jsonString);

import 'dart:convert';

Categorydrilldown categorydrilldownFromJson(String str) =>
    Categorydrilldown.fromJson(json.decode(str));

String categorydrilldownToJson(Categorydrilldown data) =>
    json.encode(data.toJson());

class Categorydrilldown {
  Categorydrilldown({
    this.meals,
  });

  List<Meal>? meals;

  factory Categorydrilldown.fromJson(Map<String, dynamic> json) =>
      Categorydrilldown(
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals!.map((x) => x.toJson())),
      };
}

class Meal {
  Meal({
    this.strMeal,
    this.strMealThumb,
    this.idMeal,
  });

  String? strMeal;
  String? strMealThumb;
  String? idMeal;

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        strMeal: json["strMeal"],
        strMealThumb: json["strMealThumb"],
        idMeal: json["idMeal"],
      );

  Map<String, dynamic> toJson() => {
        "strMeal": strMeal,
        "strMealThumb": strMealThumb,
        "idMeal": idMeal,
      };
}
