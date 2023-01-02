import 'dart:convert';

import 'package:cocktail/model/cocktailinfo.dart';
import 'package:cocktail/model/fdmode.dart';
import 'package:cocktail/model/fdmodellocation.dart';
import 'package:cocktail/reuseableConstant/constant.dart';
import 'package:cocktail/screen/foodfolder/fddrilldown.dart';
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
                    width: 250,
                    padding: EdgeInsets.all(20.0),
                    alignment: Alignment.center,
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      decoration: Ktestfeilddecoration,
                      onChanged: (value) {
                        // CityName = value;
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.saved_search,
                      color: Colors.white,
                      size: 40.0,
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

                  return
                      // ListView.builder(
                      //   scrollDirection: Axis.horizontal,
                      //   itemCount: 10,
                      //   itemBuilder: (context, index) {
                      //     if (index % 3 == 0) {
                      //       return LayoutBuilder(
                      //         builder: (context, constraints) {
                      //           return Column(
                      //             mainAxisSize: MainAxisSize.min,
                      //             children: [
                      //               Container(
                      //                   width: 100,
                      //                   height: 100,
                      //                   decoration: BoxDecoration(
                      //                     borderRadius:
                      //                         BorderRadius.all(Radius.circular(25)),
                      //                     boxShadow: [
                      //                       BoxShadow(
                      //                         color: Colors.grey.withOpacity(0.5),
                      //                         spreadRadius: 5,
                      //                         blurRadius: 7,
                      //                         offset: Offset(0,
                      //                             3), // changes position of shadow
                      //                       ),
                      //                     ],
                      //                     color: Colors.white,
                      //                   ),
                      //                   alignment: Alignment.center,
                      //                   child: Padding(
                      //                     padding: const EdgeInsets.all(20.0),
                      //                     child: Column(
                      //                       children: [
                      //                         Padding(
                      //                           padding: const EdgeInsets.only(
                      //                               bottom: 10),
                      //                           child: Row(
                      //                             children: [
                      //                               Text("Name:"),
                      //                               Text("")
                      //                             ],
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   )),
                      //             ],
                      //           );
                      //         },
                      //       );
                      //     } else {
                      //       return Text('Item $index');
                      //     }
                      //   },
                      // );

                      ListView.builder(

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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
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
                                                        snapshot
                                                                    .data!
                                                                    .meals![
                                                                        index]
                                                                    .strCategory
                                                                    .toString() ==
                                                                "Beef"
                                                            ? SizedBox(
                                                                width: 110,
                                                                child: Text(
                                                                  "Beef can be harvested from cows, bulls, heifers or steers. Acceptability as a food source varies in different parts of the world.",
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
                                                                        width:
                                                                            110,
                                                                        child:
                                                                            Text(
                                                                          "Chicken can be prepared in a vast range of ways, including baking, grilling, barbecuing, frying, and boiling",
                                                                          style:
                                                                              TextStyle(fontSize: 10),
                                                                        ),
                                                                      )
                                                                    : snapshot.data!.meals![index].strCategory.toString() ==
                                                                            "Dessert"
                                                                        ? SizedBox(
                                                                            width:
                                                                                110,
                                                                            child:
                                                                                Text(
                                                                              "Dessert consists of sweet foods, such as confections, and possibly a beverage such as dessert wine and liqueur",
                                                                              style: TextStyle(fontSize: 10),
                                                                            ),
                                                                          )
                                                                        : snapshot.data!.meals![index].strCategory.toString() ==
                                                                                "Goat"
                                                                            ? SizedBox(
                                                                                width: 110,
                                                                                child: Text(
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
                                                                    .meals![
                                                                        index]
                                                                    .strCategory
                                                                    .toString() ==
                                                                "Breakfast"
                                                            ? ClipOval(
                                                                child:
                                                                    Image.asset(
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
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/chicken1.jpeg',
                                                                      width: 90,
                                                                      height:
                                                                          90,
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
                                                                          width:
                                                                              90,
                                                                          height:
                                                                              90,
                                                                        ),
                                                                      )
                                                                    : snapshot.data!.meals![index].strCategory.toString() ==
                                                                            "Goat"
                                                                        ? ClipOval(
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/goat.jpeg',
                                                                              width: 90,
                                                                              height: 90,
                                                                            ),
                                                                          )
                                                                        : snapshot.data!.meals![index].strCategory.toString() ==
                                                                                "Lamb"
                                                                            ? ClipOval(
                                                                                child: Image.asset(
                                                                                  'assets/lamb.jpeg',
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
                  return ListView.builder(
                      itemCount: snapshot.data!.meals!.length,
                      itemBuilder: (BuildContext context, int index) {
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
                                Text("food location"),
                                Text(snapshot.data!.meals![index].strArea
                                    .toString()),
                              ],
                            ));
                      });
                } else {
                  print(snapshot.data);
                  return Text('Loading data');
                }
              },
            ),
            // FutureBuilder<Foodmodel>(
            //   future: foodingredient,
            //   builder: (
            //     BuildContext context,
            //     AsyncSnapshot<Foodmodel> snapshot,
            //   ) {
            //     if (snapshot.hasData) {
            //       print(snapshot.data);
            //       return ListView.builder(
            //           itemCount: snapshot.data!.meals!.length,
            //           itemBuilder: (BuildContext context, int index) {
            //             return InkWell(
            //                 onTap: () {},
            //                 child: Column(
            //                   children: [
            //                     Text("food category"),
            //                     Text(snapshot.data!.meals![index].strCategory
            //                         .toString()),
            //                   ],
            //                 ));
            //           });
            //     } else {
            //       print(snapshot.data);
            //       return Text('Loading data');
            //     }
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
