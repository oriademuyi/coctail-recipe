import 'package:cocktail/model/cocktailinfo.dart';
import 'package:cocktail/reuseableConstant/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Detailspage extends StatefulWidget {
  String? drinkname;
  String? drinkid;

  Detailspage({this.drinkname, this.drinkid, Key? key}) : super(key: key);

  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  Future<Album>? futureAlbum;
  Future<Album> fetchnoalcolicAlbum() async {
    final response = await http.get(Uri.parse(
        'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=${widget.drinkname.toString()}'));
    // 'https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      print(response.body);
      print(Album.fromJson(jsonDecode(response.body)).userId);

      return Album.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);

      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchnoalcolicAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.drinkname.toString()),
      ),
      body: FutureBuilder<Album>(
        future: futureAlbum,
        builder: (
          BuildContext context,
          AsyncSnapshot<Album> snapshot,
        ) {
          if (snapshot.hasData) {
            print(snapshot.data);
            return ListView.builder(
                itemCount: snapshot.data!.userId.length,
                itemBuilder: (BuildContext context, int index) {
                  // futureAlbum = snapshot.data!.userId[index]. ?? 'null';
                  return Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: 300,
                          child: Image.network(
                            snapshot.data!.userId[index].picture.toString(),
                            width: 200,
                            height: 200,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Container(
                              width: 350,
                              height: 40,
                              color: Colors.blue,
                              alignment: Alignment.center,
                              child: Text(
                                "Information",
                                style: Kheadingstyle,
                              )),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Name:"),
                            Text(
                                "${snapshot.data!.userId[index].strDrink.toString()}"),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text("Drink Id:"),
                        //     Text(
                        //         "${snapshot.data!.userId[index].idDrink.toString()}"),
                        //   ],
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Category:"),
                            Text(
                                "${snapshot.data!.userId[index].category.toString()}"),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Alcoholic:"),
                            Text(
                                "${snapshot.data!.userId[index].alcohol.toString()}"),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Glass Type:"),
                            Text(
                                "${snapshot.data!.userId[index].Glasstype.toString()}"),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Container(
                              width: 350,
                              height: 40,
                              color: Colors.blue,
                              alignment: Alignment.center,
                              child: Text(
                                "Ingredient and quantity",
                                style: Kheadingstyle,
                              )),
                        ),
                        snapshot.data!.userId[index].ingredient1.toString() ==
                                "null"
                            ? Container()
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(snapshot.data!.userId[index].ingredient1
                                      .toString()),
                                  Text(snapshot.data!.userId[index].measurement1
                                      .toString()),
                                ],
                              ),

                        snapshot.data!.userId[index].ingredient2.toString() ==
                                "null"
                            ? Container()
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(snapshot.data!.userId[index].ingredient2
                                      .toString()),
                                  Text(snapshot.data!.userId[index].measurement2
                                      .toString()),
                                ],
                              ),

                        snapshot.data!.userId[index].ingredient3.toString() ==
                                "null"
                            ? Container()
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(snapshot.data!.userId[index].ingredient3
                                      .toString()),
                                  Text(snapshot.data!.userId[index].measurement3
                                      .toString()),
                                ],
                              ),

                        snapshot.data!.userId[index].ingredient4.toString() ==
                                "null"
                            ? Container()
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(snapshot.data!.userId[index].ingredient4
                                      .toString()),
                                  Text(snapshot.data!.userId[index].measurement4
                                      .toString()),
                                ],
                              ),

                        snapshot.data!.userId[index].ingredient5.toString() ==
                                "null"
                            ? Container()
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(snapshot.data!.userId[index].ingredient5
                                      .toString()),
                                  Text(snapshot.data!.userId[index].measurement5
                                      .toString()),
                                ],
                              ),

                        snapshot.data!.userId[index].ingredient6.toString() ==
                                "null"
                            ? Container()
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(snapshot.data!.userId[index].ingredient6
                                      .toString()),
                                  Text(snapshot.data!.userId[index].measurement6
                                      .toString()),
                                ],
                              ),

                        snapshot.data!.userId[index].ingredient7.toString() ==
                                "null"
                            ? Container()
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(snapshot.data!.userId[index].ingredient7
                                      .toString()),
                                  Text(snapshot.data!.userId[index].measurement7
                                      .toString()),
                                ],
                              ),

                        snapshot.data!.userId[index].ingredient8.toString() ==
                                "null"
                            ? Container()
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(snapshot.data!.userId[index].ingredient8
                                      .toString()),
                                  Text(snapshot.data!.userId[index].measurement8
                                      .toString()),
                                ],
                              ),

                        snapshot.data!.userId[index].ingredient9.toString() ==
                                "null"
                            ? Container()
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(snapshot.data!.userId[index].ingredient9
                                      .toString()),
                                  Text(snapshot.data!.userId[index].measurement9
                                      .toString()),
                                ],
                              ),

                        snapshot.data!.userId[index].ingredient10.toString() ==
                                "null"
                            ? Container()
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(snapshot.data!.userId[index].ingredient10
                                      .toString()),
                                  Text(snapshot
                                      .data!.userId[index].measurement10
                                      .toString()),
                                ],
                              ),

                        snapshot.data!.userId[index].ingredient11.toString() ==
                                "null"
                            ? Container()
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(snapshot.data!.userId[index].ingredient11
                                      .toString()),
                                  Text(snapshot
                                      .data!.userId[index].measurement11
                                      .toString()),
                                ],
                              ),

                        snapshot.data!.userId[index].ingredient12.toString() ==
                                "null"
                            ? Container()
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(snapshot.data!.userId[index].ingredient12
                                      .toString()),
                                  Text(snapshot
                                      .data!.userId[index].measurement12
                                      .toString()),
                                ],
                              ),

                        snapshot.data!.userId[index].ingredient13.toString() ==
                                "null"
                            ? Container()
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(snapshot.data!.userId[index].ingredient13
                                      .toString()),
                                  Text(snapshot
                                      .data!.userId[index].measurement13
                                      .toString()),
                                ],
                              ),
                        snapshot.data!.userId[index].ingredient14.toString() ==
                                "null"
                            ? Container()
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(snapshot.data!.userId[index].ingredient14
                                      .toString()),
                                  Text(snapshot
                                      .data!.userId[index].measurement14
                                      .toString()),
                                ],
                              ),
                        snapshot.data!.userId[index].ingredient15.toString() ==
                                "null"
                            ? Container()
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(snapshot.data!.userId[index].ingredient15
                                      .toString()),
                                  Text(snapshot
                                      .data!.userId[index].measurement15
                                      .toString()),
                                ],
                              ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Container(
                              width: 350,
                              height: 40,
                              color: Colors.blue,
                              alignment: Alignment.center,
                              child: Text(
                                "Recipe",
                                style: Kheadingstyle,
                              )),
                        ),
                        Text(snapshot.data!.userId[index].instruction
                            .toString()),
                      ],
                    ),
                  );
                });
          } else {
            print(snapshot.data);
            return Text('Loading data');
          }
        },
      ),

      // Column(
      //   children: [
      //     Text(widget.drinkname.toString()),
      //     Text(widget.drinkid.toString()),
      //   ],
      // ),
    );
  }
}
