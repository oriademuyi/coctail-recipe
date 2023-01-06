import 'dart:convert';

import 'package:cocktail/model/cocktailinfo.dart';
import 'package:cocktail/model/fdmode.dart';
import 'package:cocktail/model/fdmodellocation.dart';
import 'package:cocktail/reuseableConstant/constant.dart';
import 'package:cocktail/screen/foodfolder/fddrilldown.dart';
import 'package:cocktail/screen/foodfolder/fdfurtherdrilldown.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class fdwelcomepage extends StatefulWidget {
  const fdwelcomepage({Key? key}) : super(key: key);

  @override
  State<fdwelcomepage> createState() => _fdwelcomepageState();
}

class _fdwelcomepageState extends State<fdwelcomepage> {
  Future<Foodmodel>? foodcategory;
  Future<Foodmodellocation>? foodlaocation;
  Future<Foodmodel>? foodingredient;
  String? CityName;

  Future<Foodmodel> fetchfoodcategory() async {
    final response = await http.get(
        Uri.parse('http://www.themealdb.com/api/json/v1/1/list.php?c=list'));
    // 'https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      print(response.body);
      print(Foodmodel.fromJson(jsonDecode(response.body)).meals);

      // print(futureAlbum);

      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Foodmodel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<Foodmodellocation> fetchfoodlocation() async {
    final response = await http.get(
        Uri.parse('http://www.themealdb.com/api/json/v1/1/list.php?a=list'));
    // 'https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      print(response.body);
      print(Foodmodellocation.fromJson(jsonDecode(response.body)).meals);

      // print(futureAlbum);

      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Foodmodellocation.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<Foodmodel> fetchfoodingredient() async {
    final response = await http.get(
        Uri.parse('http://www.themealdb.com/api/json/v1/1/list.php?i=list'));
    // 'https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      print(response.body);
      print(Foodmodel.fromJson(jsonDecode(response.body)).meals);

      // print(futureAlbum);

      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Foodmodel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    foodcategory = fetchfoodcategory();
    foodlaocation = fetchfoodlocation();
    foodingredient = fetchfoodingredient();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: 80,
                    width: 200,
                    padding: EdgeInsets.only(
                      bottom: 25,
                      top: 15,
                    ),
                    alignment: Alignment.center,
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      decoration: Ktestfeilddecoration,
                      onChanged: (value) {
                        CityName = value;
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      CityName == ''
                          ? Container()
                          : Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                              return fdfurtherdrilldown(
                                foodname: CityName,
                              );
                            }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 9.5),
                      child: Container(
                        height: 42,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: Colors.grey.shade300,
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: "Category",
              ),
              Tab(
                icon: Icon(Icons.location_city),
                text: "Location",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FutureBuilder<Foodmodel>(
              future: foodcategory,
              builder: (
                BuildContext context,
                AsyncSnapshot<Foodmodel> snapshot,
              ) {
                if (snapshot.hasData) {
                  print(snapshot.data);

                  return ListView.builder(

                      // itemCount: 3,
                      itemCount: snapshot.data!.meals!.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => fdfrilldown(
                                  categoryname: snapshot
                                      .data!.meals![index].strCategory
                                      .toString(),
                                  role: "category",
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Container(
                                    width: 250,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      color: Colors.white,
                                    ),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(snapshot
                                                        .data!
                                                        .meals![index]
                                                        .strCategory
                                                        .toString()),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    snapshot.data!.meals![index]
                                                                .strCategory
                                                                .toString() ==
                                                            "Beef"
                                                        ? SizedBox(
                                                            width: 110,
                                                            child: Text(
                                                              "Beef can be harvested from cows, bulls, heifers or steers. Acceptability as a food source varies in different parts of the world.",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            ),
                                                          )
                                                        : snapshot
                                                                    .data!
                                                                    .meals![
                                                                        index]
                                                                    .strCategory
                                                                    .toString() ==
                                                                "Breakfast"
                                                            ? SizedBox(
                                                                width: 110,
                                                                child: Text(
                                                                  "Breakfast is the meal taken after rising from a night's sleep, most often eaten in the early morning before undertaking a day's work",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                ),
                                                              )
                                                            : snapshot
                                                                        .data!
                                                                        .meals![
                                                                            index]
                                                                        .strCategory
                                                                        .toString() ==
                                                                    "Chicken"
                                                                ? SizedBox(
                                                                    width: 110,
                                                                    child: Text(
                                                                      "Chicken can be prepared in a vast range of ways, including baking, grilling, barbecuing, frying, and boiling",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              10),
                                                                    ),
                                                                  )
                                                                : snapshot
                                                                            .data!
                                                                            .meals![index]
                                                                            .strCategory
                                                                            .toString() ==
                                                                        "Dessert"
                                                                    ? SizedBox(
                                                                        width:
                                                                            110,
                                                                        child:
                                                                            Text(
                                                                          "Dessert consists of sweet foods, such as confections, and possibly a beverage such as dessert wine and liqueur",
                                                                          style:
                                                                              TextStyle(fontSize: 10),
                                                                        ),
                                                                      )
                                                                    : snapshot.data!.meals![index].strCategory.toString() == "Goat"
                                                                        ? SizedBox(
                                                                            width:
                                                                                110,
                                                                            child:
                                                                                Text(
                                                                              "Goat meat is the meat of the domestic goat. It is often called chevon or mutton when the meat comes from adults, and capretto otherwise ",
                                                                              style: TextStyle(fontSize: 10),
                                                                            ),
                                                                          )
                                                                        : snapshot.data!.meals![index].strCategory.toString() == "Lamb"
                                                                            ? SizedBox(
                                                                                width: 110,
                                                                                child: Text(
                                                                                  "Lamb is a  term for the meat of domestic sheep  at different ages. A sheep in its first year is called a lamb, and its meat is also called lamb",
                                                                                  style: TextStyle(fontSize: 10),
                                                                                ),
                                                                              )
                                                                            : snapshot.data!.meals![index].strCategory.toString() == "Miscellaneous"
                                                                                ? SizedBox(
                                                                                    width: 110,
                                                                                    child: Text(
                                                                                      "",
                                                                                      style: TextStyle(fontSize: 10),
                                                                                    ),
                                                                                  )
                                                                                : snapshot.data!.meals![index].strCategory.toString() == "Pasta"
                                                                                    ? SizedBox(
                                                                                        width: 110,
                                                                                        child: Text(
                                                                                          "Pasta is a type of food typically made from an unleavened dough of wheat flour mixed with water or eggs.",
                                                                                          style: TextStyle(fontSize: 10),
                                                                                        ),
                                                                                      )
                                                                                    : snapshot.data!.meals![index].strCategory.toString() == "Pork"
                                                                                        ? SizedBox(
                                                                                            width: 110,
                                                                                            child: Text(
                                                                                              "Pork is the culinary name for the meat of the domestic pig. It is the most commonly consumed meat worldwide",
                                                                                              style: TextStyle(fontSize: 10),
                                                                                            ),
                                                                                          )
                                                                                        : snapshot.data!.meals![index].strCategory.toString() == "Seafood"
                                                                                            ? SizedBox(
                                                                                                width: 110,
                                                                                                child: Text(
                                                                                                  "Seafood is any form of sea life regarded as food by humans, prominently including fish and shellfish",
                                                                                                  style: TextStyle(fontSize: 10),
                                                                                                ),
                                                                                              )
                                                                                            : snapshot.data!.meals![index].strCategory.toString() == "Starter"
                                                                                                ? SizedBox(
                                                                                                    width: 110,
                                                                                                    child: Text(
                                                                                                      "Bread starter or sponge, a fermented mixture used in baking sourdough",
                                                                                                      style: TextStyle(fontSize: 10),
                                                                                                    ),
                                                                                                  )
                                                                                                : snapshot.data!.meals![index].strCategory.toString() == "Vegan"
                                                                                                    ? SizedBox(
                                                                                                        width: 110,
                                                                                                        child: Text(
                                                                                                          "A vegan diet is based on plants  foods made from plants. Vegans do not eat foods that come from animals,",
                                                                                                          style: TextStyle(fontSize: 10),
                                                                                                        ),
                                                                                                      )
                                                                                                    : snapshot.data!.meals![index].strCategory.toString() == "Vegetarian"
                                                                                                        ? SizedBox(
                                                                                                            width: 110,
                                                                                                            child: Text(
                                                                                                              "Vegetarian cuisine is based on food that meets vegetarian standards by not including meat and animal tissue products",
                                                                                                              style: TextStyle(fontSize: 10),
                                                                                                            ),
                                                                                                          )
                                                                                                        : SizedBox(
                                                                                                            width: 110,
                                                                                                            child: Text(
                                                                                                              "can be prepared in a vast range of ways, including baking, grilling, barbecuing, frying, and boiling",
                                                                                                              style: TextStyle(fontSize: 10),
                                                                                                            ),
                                                                                                          ),
                                                  ],
                                                ),
                                                snapshot.data!.meals![index]
                                                            .strCategory
                                                            .toString() ==
                                                        "Beef"
                                                    ? ClipOval(
                                                        child: Image.asset(
                                                          'assets/beef2.jpeg',
                                                          width: 100,
                                                          height: 100,
                                                        ),
                                                      )
                                                    : snapshot
                                                                .data!
                                                                .meals![index]
                                                                .strCategory
                                                                .toString() ==
                                                            "Breakfast"
                                                        ? ClipOval(
                                                            child: Image.asset(
                                                              'assets/breakfast.webp',
                                                              width: 90,
                                                              height: 90,
                                                            ),
                                                          )
                                                        : snapshot
                                                                    .data!
                                                                    .meals![
                                                                        index]
                                                                    .strCategory
                                                                    .toString() ==
                                                                "Chicken"
                                                            ? ClipOval(
                                                                child:
                                                                    Image.asset(
                                                                  'assets/chicken1.jpeg',
                                                                  width: 90,
                                                                  height: 90,
                                                                ),
                                                              )
                                                            : snapshot
                                                                        .data!
                                                                        .meals![
                                                                            index]
                                                                        .strCategory
                                                                        .toString() ==
                                                                    "Dessert"
                                                                ? ClipOval(
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/desset.jpeg',
                                                                      width: 90,
                                                                      height:
                                                                          90,
                                                                    ),
                                                                  )
                                                                : snapshot.data!.meals![index].strCategory
                                                                            .toString() ==
                                                                        "Goat"
                                                                    ? ClipOval(
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/goat.jpeg',
                                                                          width:
                                                                              90,
                                                                          height:
                                                                              90,
                                                                        ),
                                                                      )
                                                                    : snapshot.data!.meals![index].strCategory.toString() == "Lamb"
                                                                        ? ClipOval(
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/lamb.jpeg',
                                                                              width: 90,
                                                                              height: 90,
                                                                            ),
                                                                          )
                                                                        : snapshot.data!.meals![index].strCategory.toString() == "Pasta"
                                                                            ? ClipOval(
                                                                                child: Image.asset(
                                                                                  'assets/pasta1.jpeg',
                                                                                  width: 90,
                                                                                  height: 90,
                                                                                ),
                                                                              )
                                                                            : snapshot.data!.meals![index].strCategory.toString() == "Pork"
                                                                                ? ClipOval(
                                                                                    child: Image.asset(
                                                                                      'assets/pork1.jpeg',
                                                                                      width: 90,
                                                                                      height: 90,
                                                                                    ),
                                                                                  )
                                                                                : snapshot.data!.meals![index].strCategory.toString() == "Miscellaneous"
                                                                                    ? ClipOval(
                                                                                        child: Image.asset(
                                                                                          'assets/misss2.jpeg',
                                                                                          width: 90,
                                                                                          height: 90,
                                                                                        ),
                                                                                      )
                                                                                    : snapshot.data!.meals![index].strCategory.toString() == "Seafood"
                                                                                        ? ClipOval(
                                                                                            child: Image.asset(
                                                                                              'assets/seafood.jpeg',
                                                                                              width: 90,
                                                                                              height: 90,
                                                                                            ),
                                                                                          )
                                                                                        : snapshot.data!.meals![index].strCategory.toString() == "Side"
                                                                                            ? ClipOval(
                                                                                                child: Image.asset(
                                                                                                  'assets/side.jpeg',
                                                                                                  width: 90,
                                                                                                  height: 90,
                                                                                                ),
                                                                                              )
                                                                                            : snapshot.data!.meals![index].strCategory.toString() == "Starter"
                                                                                                ? ClipOval(
                                                                                                    child: Image.asset(
                                                                                                      'assets/start.jpeg',
                                                                                                      width: 90,
                                                                                                      height: 90,
                                                                                                    ),
                                                                                                  )
                                                                                                : snapshot.data!.meals![index].strCategory.toString() == "Vegan"
                                                                                                    ? ClipOval(
                                                                                                        child: Image.asset(
                                                                                                          'assets/vagan.jpeg',
                                                                                                          width: 90,
                                                                                                          height: 90,
                                                                                                        ),
                                                                                                      )
                                                                                                    : snapshot.data!.meals![index].strCategory.toString() == "Vegetarian"
                                                                                                        ? ClipOval(
                                                                                                            child: Image.asset(
                                                                                                              'assets/veg.jpeg',
                                                                                                              width: 90,
                                                                                                              height: 90,
                                                                                                            ),
                                                                                                          )
                                                                                                        : ClipOval(
                                                                                                            child: Image.asset(
                                                                                                              'assets/breakfast.webp',
                                                                                                              width: 90,
                                                                                                              height: 90,
                                                                                                            ),
                                                                                                          )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        );
                      });
                } else {
                  print(snapshot.data);
                  return Text('Loading data');
                }
              },
            ),
            FutureBuilder<Foodmodellocation>(
              future: foodlaocation,
              builder: (
                BuildContext context,
                AsyncSnapshot<Foodmodellocation> snapshot,
              ) {
                if (snapshot.hasData) {
                  print(snapshot.data);
                  return GridView.count(
                      crossAxisCount: 3,
                      children:
                          List.generate(snapshot.data!.meals!.length, (index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => fdfrilldown(
                                  categoryname: snapshot
                                      .data!.meals![index].strArea
                                      .toString(),
                                  role: "location",
                                ),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  width: 90,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    color: Colors.white,
                                  ),
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 15),
                                      Text(snapshot.data!.meals![index].strArea
                                          .toString()),
                                      snapshot.data!.meals![index].strArea ==
                                              "American"
                                          ? ClipOval(
                                              child: Image.asset(
                                                'assets/americaflag.png',
                                                width: 50,
                                                height: 50,
                                              ),
                                            )
                                          : snapshot.data!.meals![index]
                                                      .strArea ==
                                                  "British"
                                              ? ClipOval(
                                                  child: Image.asset(
                                                    'assets/britishflag.png',
                                                    width: 50,
                                                    height: 50,
                                                  ),
                                                )
                                              : snapshot.data!.meals![index]
                                                          .strArea ==
                                                      "Canadian"
                                                  ? ClipOval(
                                                      child: Image.asset(
                                                        'assets/cannadaflag2.webp',
                                                        width: 50,
                                                        height: 50,
                                                      ),
                                                    )
                                                  : snapshot.data!.meals![index]
                                                              .strArea ==
                                                          "Chinese"
                                                      ? ClipOval(
                                                          child: Image.asset(
                                                            'assets/chineseflag.webp',
                                                            width: 50,
                                                            height: 50,
                                                          ),
                                                        )
                                                      : snapshot
                                                                  .data!
                                                                  .meals![index]
                                                                  .strArea ==
                                                              "Croatian"
                                                          ? ClipOval(
                                                              child:
                                                                  Image.asset(
                                                                'assets/crotainflag.png',
                                                                width: 50,
                                                                height: 50,
                                                              ),
                                                            )
                                                          : snapshot
                                                                      .data!
                                                                      .meals![
                                                                          index]
                                                                      .strArea ==
                                                                  "Dutch"
                                                              ? ClipOval(
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/dutch.png',
                                                                    width: 50,
                                                                    height: 50,
                                                                  ),
                                                                )
                                                              : snapshot
                                                                          .data!
                                                                          .meals![
                                                                              index]
                                                                          .strArea ==
                                                                      "Egyptian"
                                                                  ? ClipOval(
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/egyptflag.png',
                                                                        width:
                                                                            50,
                                                                        height:
                                                                            50,
                                                                      ),
                                                                    )
                                                                  : snapshot.data!.meals![index].strArea ==
                                                                          "French"
                                                                      ? ClipOval(
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/franceflag.webp',
                                                                            width:
                                                                                50,
                                                                            height:
                                                                                50,
                                                                          ),
                                                                        )
                                                                      : snapshot.data!.meals![index].strArea ==
                                                                              "Greek"
                                                                          ? ClipOval(
                                                                              child: Image.asset(
                                                                                'assets/grece.webp',
                                                                                width: 50,
                                                                                height: 50,
                                                                              ),
                                                                            )
                                                                          : snapshot.data!.meals![index].strArea == "Indian"
                                                                              ? ClipOval(
                                                                                  child: Image.asset(
                                                                                    'assets/indian.webp',
                                                                                    width: 50,
                                                                                    height: 50,
                                                                                  ),
                                                                                )
                                                                              : snapshot.data!.meals![index].strArea == "Irish"
                                                                                  ? ClipOval(
                                                                                      child: Image.asset(
                                                                                        'assets/irish.webp',
                                                                                        width: 50,
                                                                                        height: 50,
                                                                                      ),
                                                                                    )
                                                                                  : snapshot.data!.meals![index].strArea == "Italian"
                                                                                      ? ClipOval(
                                                                                          child: Image.asset(
                                                                                            'assets/italy.png',
                                                                                            width: 50,
                                                                                            height: 50,
                                                                                          ),
                                                                                        )
                                                                                      : snapshot.data!.meals![index].strArea == "Jamaican"
                                                                                          ? ClipOval(
                                                                                              child: Image.asset(
                                                                                                'assets/jamaica.jpeg',
                                                                                                width: 50,
                                                                                                height: 50,
                                                                                              ),
                                                                                            )
                                                                                          : snapshot.data!.meals![index].strArea == "Japanese"
                                                                                              ? ClipOval(
                                                                                                  child: Image.asset(
                                                                                                    'assets/japanese.png',
                                                                                                    width: 50,
                                                                                                    height: 50,
                                                                                                  ),
                                                                                                )
                                                                                              : snapshot.data!.meals![index].strArea == "Kenyan"
                                                                                                  ? ClipOval(
                                                                                                      child: Image.asset(
                                                                                                        'assets/kenya.webp',
                                                                                                        width: 50,
                                                                                                        height: 50,
                                                                                                      ),
                                                                                                    )
                                                                                                  : snapshot.data!.meals![index].strArea == "Malaysian"
                                                                                                      ? ClipOval(
                                                                                                          child: Image.asset(
                                                                                                            'assets/malasia.webp',
                                                                                                            width: 50,
                                                                                                            height: 50,
                                                                                                          ),
                                                                                                        )
                                                                                                      : snapshot.data!.meals![index].strArea == "Mexican"
                                                                                                          ? ClipOval(
                                                                                                              child: Image.asset(
                                                                                                                'assets/mesico.webp',
                                                                                                                width: 50,
                                                                                                                height: 50,
                                                                                                              ),
                                                                                                            )
                                                                                                          : snapshot.data!.meals![index].strArea == "Moroccan"
                                                                                                              ? ClipOval(
                                                                                                                  child: Image.asset(
                                                                                                                    'assets/moroco.png',
                                                                                                                    width: 50,
                                                                                                                    height: 50,
                                                                                                                  ),
                                                                                                                )
                                                                                                              : snapshot.data!.meals![index].strArea == "Polish"
                                                                                                                  ? ClipOval(
                                                                                                                      child: Image.asset(
                                                                                                                        'assets/polish.png',
                                                                                                                        width: 50,
                                                                                                                        height: 50,
                                                                                                                      ),
                                                                                                                    )
                                                                                                                  : snapshot.data!.meals![index].strArea == "Portuguese"
                                                                                                                      ? ClipOval(
                                                                                                                          child: Image.asset(
                                                                                                                            'assets/portugal.png',
                                                                                                                            width: 50,
                                                                                                                            height: 50,
                                                                                                                          ),
                                                                                                                        )
                                                                                                                      : snapshot.data!.meals![index].strArea == "Russian"
                                                                                                                          ? ClipOval(
                                                                                                                              child: Image.asset(
                                                                                                                                'assets/russian.png',
                                                                                                                                width: 50,
                                                                                                                                height: 50,
                                                                                                                              ),
                                                                                                                            )
                                                                                                                          : snapshot.data!.meals![index].strArea == "Spanish"
                                                                                                                              ? ClipOval(
                                                                                                                                  child: Image.asset(
                                                                                                                                    'assets/spain.png',
                                                                                                                                    width: 50,
                                                                                                                                    height: 50,
                                                                                                                                  ),
                                                                                                                                )
                                                                                                                              : snapshot.data!.meals![index].strArea == "Thai"
                                                                                                                                  ? ClipOval(
                                                                                                                                      child: Image.asset(
                                                                                                                                        'assets/thaia.png',
                                                                                                                                        width: 50,
                                                                                                                                        height: 50,
                                                                                                                                      ),
                                                                                                                                    )
                                                                                                                                  : snapshot.data!.meals![index].strArea == "Tunisian"
                                                                                                                                      ? ClipOval(
                                                                                                                                          child: Image.asset(
                                                                                                                                            'assets/tunisha.png',
                                                                                                                                            width: 50,
                                                                                                                                            height: 50,
                                                                                                                                          ),
                                                                                                                                        )
                                                                                                                                      : snapshot.data!.meals![index].strArea == "Turkish"
                                                                                                                                          ? ClipOval(
                                                                                                                                              child: Image.asset(
                                                                                                                                                'assets/turkis.png',
                                                                                                                                                width: 50,
                                                                                                                                                height: 50,
                                                                                                                                              ),
                                                                                                                                            )
                                                                                                                                          : snapshot.data!.meals![index].strArea == "Unknown"
                                                                                                                                              ? ClipOval(
                                                                                                                                                  child: Image.asset(
                                                                                                                                                    'assets/italy.png',
                                                                                                                                                    width: 50,
                                                                                                                                                    height: 50,
                                                                                                                                                  ),
                                                                                                                                                )
                                                                                                                                              : snapshot.data!.meals![index].strArea == "Vietnamese"
                                                                                                                                                  ? ClipOval(
                                                                                                                                                      child: Image.asset(
                                                                                                                                                        'assets/vitman.png',
                                                                                                                                                        width: 50,
                                                                                                                                                        height: 50,
                                                                                                                                                      ),
                                                                                                                                                    )
                                                                                                                                                  : ClipOval(
                                                                                                                                                      child: Image.asset(
                                                                                                                                                        'assets/grece.webp',
                                                                                                                                                        width: 50,
                                                                                                                                                        height: 50,
                                                                                                                                                      ),
                                                                                                                                                    )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }));
                } else {
                  print(snapshot.data);
                  return Text('Loading data');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
