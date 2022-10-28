// import 'package:cocktail/model/cocktailinfo.dart';
// import 'package:http/http.dart' as http;

// class CocktailModel {
//   Future <Album> fetchCocktail() async {
//     final response = await http.get(Uri.parse(
//         'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita'));
//     print(response);
//     return response;
//   }
// }

import 'dart:convert';

import 'package:cocktail/model/cocktailinfo.dart';
import 'package:flutter/material.dart';


//  Getdataprint () {
//   return FutureBuilder<Album>(
//         future: futureAlbum,
//         builder: (
//           BuildContext context,
//           AsyncSnapshot<Album> snapshot,
//         ) {
//           if (snapshot.hasData) {
//             print(snapshot.data);
//             return Column(
//               children: [
//                 Text(snapshot.data!.userId.toString()),
//                 Text(snapshot.data!.drinkname.toString()),
//                 Text(snapshot.data!.Category.toString()),
//                 Text(snapshot.data!.Alcoholic.toString()),
//               ],
//             );
//           } else {
//             print(snapshot.data);
//             return Text('Loading data');
//           }
//         },
//       ),
//  }
