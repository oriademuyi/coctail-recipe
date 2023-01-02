// To parse this JSON data, do
//
//     final foodmodellocation = foodmodellocationFromJson(jsonString);

import 'dart:convert';

Foodmodellocation foodmodellocationFromJson(String str) =>
    Foodmodellocation.fromJson(json.decode(str));

String foodmodellocationToJson(Foodmodellocation data) =>
    json.encode(data.toJson());

class Foodmodellocation {
  Foodmodellocation({
    this.meals,
  });

  List<Meal>? meals;

  factory Foodmodellocation.fromJson(Map<String, dynamic> json) =>
      Foodmodellocation(
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals!.map((x) => x.toJson())),
      };
}

class Meal {
  Meal({
    this.strArea,
  });

  String? strArea;

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        strArea: json["strArea"],
      );

  Map<String, dynamic> toJson() => {
        "strArea": strArea,
      };
}
