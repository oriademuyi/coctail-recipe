import 'dart:ui';

import 'package:flutter/foundation.dart';

class Fddetailsmodel {
  final List<DefaultDatum> foodId;
  final foodname;
  final Category;
  final strAre;
  final Picture;
  // final strInstructions;

  Fddetailsmodel({
    required this.foodId,
    this.foodname,
    this.Category,
    this.strAre,
    this.Picture,
    // this.strInstructions;
  });

  factory Fddetailsmodel.fromJson(Map<String, dynamic> json) {
    return Fddetailsmodel(
      // userId: json["drinks"] ?? [],
      foodId: List<DefaultDatum>.from(
          json["meals"].map((x) => DefaultDatum.fromJson(x))),
      foodname: json["meals"][0]['strMeal'] ?? [],
      Category: json["meals"][0]['strCategory'] ?? [],
      strAre: json["meals"][0]['strArea'] ?? [],
      Picture: json["meals"][0]['strMealThumb'] ?? [],

      // id: json['id'] ?? 0,
      // title: json['title'] ?? "",
    );
  }

  // get lenght => null;
}
//do this if this is list statement

class DefaultDatum {
  DefaultDatum({
    this.idDrink,
    this.strDrink,
    this.strDrinkAlternate,
    this.strTags,
    this.picture,
    this.category,
    this.instruction,
    this.alcohol,
    this.Glasstype,
    this.ingredient1,
    this.ingredient2,
    this.ingredient3,
    this.ingredient4,
    this.ingredient5,
    this.ingredient6,
    this.ingredient7,
    this.ingredient8,
    this.ingredient9,
    this.ingredient10,
    this.ingredient11,
    this.ingredient12,
    this.ingredient13,
    this.ingredient14,
    this.ingredient15,
    this.measurement1,
    this.measurement2,
    this.measurement3,
    this.measurement4,
    this.measurement5,
    this.measurement6,
    this.measurement7,
    this.measurement8,
    this.measurement9,
    this.measurement10,
    this.measurement11,
    this.measurement12,
    this.measurement13,
    this.measurement14,
    this.measurement15,
  });

  String? idDrink;
  String? strDrink;
  String? strDrinkAlternate;
  String? strTags;
  String? picture;
  String? category;
  String? instruction;
  String? alcohol;
  String? Glasstype;
  String? ingredient1;
  String? ingredient2;
  String? ingredient3;
  String? ingredient4;
  String? ingredient5;
  String? ingredient6;
  String? ingredient7;
  String? ingredient8;
  String? ingredient9;
  String? ingredient10;
  String? ingredient11;
  String? ingredient12;
  String? ingredient13;
  String? ingredient14;
  String? ingredient15;

  String? measurement1;
  String? measurement2;
  String? measurement3;
  String? measurement4;
  String? measurement5;
  String? measurement6;
  String? measurement7;
  String? measurement8;
  String? measurement9;
  String? measurement10;
  String? measurement11;
  String? measurement12;
  String? measurement13;
  String? measurement14;
  String? measurement15;

  factory DefaultDatum.fromJson(Map<String, dynamic> json) => DefaultDatum(
        idDrink: json["idDrink"],
        strDrink: json["strDrink"],
        strDrinkAlternate: json["strDrinkAlternate"],
        strTags: json["strTags"],
        picture: json["strDrinkThumb"],
        category: json["strCategory"],
        instruction: json["strInstructions"],
        alcohol: json["strAlcoholic"],
        Glasstype: json["strGlass"],
        ingredient1: json["strIngredient1"],
        ingredient2: json["strIngredient2"],
        ingredient3: json["strIngredient3"],
        ingredient4: json["strIngredient4"],
        ingredient5: json["strIngredient5"],
        ingredient6: json["strIngredient6"],
        ingredient7: json["strIngredient7"],
        ingredient8: json["strIngredient8"],
        ingredient9: json["strIngredient9"],
        ingredient10: json["strIngredient10"],
        ingredient11: json["strIngredient11"],
        ingredient12: json["strIngredient12"],
        ingredient13: json["strIngredient13"],
        ingredient14: json["strIngredient14"],
        ingredient15: json["strIngredient15"],

        measurement1: json["measurement1"],
        measurement2: json["measurement2"],
        measurement3: json["measurement3"],
        measurement4: json["measurement4"],
        measurement5: json["measurement5"],
        measurement6: json["measurement6"],
        measurement7: json["measurement7"],
        measurement8: json["measurement8"],
        measurement9: json["measurement9"],
        measurement10: json["measurement10"],
        measurement11: json["measurement11"],
        measurement12: json["measurement12"],
        measurement13: json["measurement13"],
        measurement14: json["measurement14"],
        measurement15: json["measurement15"],

        // from: json["from"],

        // to: json["to"],
        // distance: json["distance"],
        // endLocation: Location.fromJson(json["end_location"]),
        // startLocation: Location.fromJson(json["start_location"]),
        // modeOfPayment: modeOfPaymentValues.map[json["mode_of_payment"]],
        // dateListed: json["date_listed"],
        // timeStamp: DateTime.parse(json["time_stamp"]),
        // quote: json["quote"],
        // deliveryId: json["delivery_id"],
        // durationInTraffic: json["duration_in_traffic"],
        // duration: json["duration"],
        // itemCategory: json["item_category"],
        // modeOfDelivery: json["mode_of_delivery"],
        // deliveryTimeFrame: json["delivery_time_frame"],
        // pickupDate: DateTime.parse(json["pickup_date"]),
        // bestQuote: json["best_quote"] == null ? null : json["best_quote"],
      );

  Map<String, dynamic> toJson() => {
        "idDrink": idDrink,
        "strDrink": strDrink,
        "strDrinkAlternate": strDrinkAlternate,
        "strTags": strTags,
        "strDrinkThumb": picture,
        "strCategory": category,
        "strInstructions": instruction,
        "strAlcoholic": alcohol,
        "strGlass": Glasstype,
        "strIngredient1": ingredient1,
        "strIngredient2": ingredient2,
        "strIngredient3": ingredient3,
        "strIngredient4": ingredient4,
        "strIngredient5": ingredient5,
        "strIngredient6": ingredient6,
        "strIngredient7": ingredient7,
        "strIngredient8": ingredient8,
        "strIngredient9": ingredient9,
        "strIngredient10": ingredient10,
        "strIngredient11": ingredient11,
        "strIngredient12": ingredient12,
        "strIngredient13": ingredient13,
        "strIngredient14": ingredient14,
        "strIngredient15": ingredient15,
        "measurement1": measurement1,
        "strMeasure2": measurement2,
        "strMeasure3": measurement3,
        "strMeasure4": measurement4,
        "strMeasure5": measurement5,
        "strMeasure6": measurement6,
        "strMeasure7": measurement7,
        "strMeasure8": measurement8,
        "strMeasure9": measurement9,
        "strMeasure10": measurement10,
        "strMeasure11": measurement11,
        "strMeasure12": measurement12,
        "strMeasure13": measurement13,
        "strMeasure14": measurement14,
        "strMeasure15": measurement15,
      };
}
