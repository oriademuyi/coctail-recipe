// To parse this JSON data, do
//
//     final foodmodel = foodmodelFromJson(jsonString);

import 'dart:convert';

Foodmodel foodmodelFromJson(String str) => Foodmodel.fromJson(json.decode(str));

String foodmodelToJson(Foodmodel data) => json.encode(data.toJson());

class Foodmodel {
  Foodmodel({
    this.meals,
  });

  List<Meal>? meals;

  factory Foodmodel.fromJson(Map<String, dynamic> json) => Foodmodel(
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals!.map((x) => x.toJson())),
      };
}

class Meal {
  Meal({
    this.strCategory,
  });

  String? strCategory;

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        strCategory: json["strCategory"],
      );

  Map<String, dynamic> toJson() => {
        "strCategory": strCategory,
      };
}
