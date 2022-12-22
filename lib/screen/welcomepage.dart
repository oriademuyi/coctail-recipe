import 'package:cocktail/model/cocktailinfo.dart';
import 'package:cocktail/reuseableConstant/constant.dart';
import 'package:cocktail/screen/detailspage.dart';
import 'package:cocktail/screen/loadingpage.dart';
import 'package:cocktail/screen/orderpage.dart';
import 'package:cocktail/screen/placeorder.dart';
import 'package:cocktail/screen/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class welcomepage extends StatefulWidget {
  const welcomepage({Key? key}) : super(key: key);

  @override
  State<welcomepage> createState() => _welcomepageState();
}

class _welcomepageState extends State<welcomepage> {
  Future<Album>? futureAlbum;
  Future<Album>? futurenonAlbum;
  String? CityName;
  bool _isLoading = false;

  bool searchoption = false;

  Future<Album> fetchnoalcolicAlbum() async {
    final response = await http.get(Uri.parse(
        'http://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic'));
    // 'https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      print(response.body);
      print(Album.fromJson(jsonDecode(response.body)).userId);

      // print(futureAlbum);

      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<Album> fetchnotnoalcolicAlbum() async {
    final response = await http.get(Uri.parse(
        'http://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic'));
    // 'https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      print(response.body);
      print(Album.fromJson(jsonDecode(response.body)).userId);

      // print(futureAlbum);

      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchnoalcolicAlbum();
    futurenonAlbum = fetchnotnoalcolicAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
          title: Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    height: 80,
                    width: 300,
                    padding: EdgeInsets.all(20.0),
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
                              return Searchpage(
                                drinkname: CityName,
                              );
                            }));
                    },
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
                icon: Icon(Icons.wine_bar),
                text: "Alcoholic",
              ),
              Tab(
                icon: Icon(Icons.no_drinks),
                text: "Non-Alcoholic",
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TabBarView(
            children: [
              FutureBuilder<Album>(
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
                          return InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                print(snapshot.data!.userId[index].strDrink);
                                print(snapshot.data!.userId[index].idDrink);

                                return Detailspage(
                                  drinkid: snapshot.data!.userId[index].idDrink,
                                  drinkname:
                                      snapshot.data!.userId[index].strDrink,
                                );
                              }));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 300,
                                      height: 220,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25)),
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
                                                children: [
                                                  Text("Name:"),
                                                  Text(snapshot.data!
                                                      .userId[index].strDrink
                                                      .toString())
                                                ],
                                              ),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    // SizedBox(
                                                    //     width: 100,
                                                    //     child: Text(snapshot
                                                    //         .data!
                                                    //         .userId[index]
                                                    //         .strDrink
                                                    //         .toString())),
                                                    Row(
                                                      children: [
                                                        Text("ID:"),
                                                        Text(snapshot
                                                            .data!
                                                            .userId[index]
                                                            .idDrink
                                                            .toString()),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 50),
                                                      child: TextButton(
                                                          onPressed: () {
                                                            print(
                                                              snapshot
                                                                  .data!
                                                                  .userId[index]
                                                                  .category,
                                                            );
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) {
                                                              return placeorderpage(
                                                                drinkid: snapshot
                                                                    .data!
                                                                    .userId[
                                                                        index]
                                                                    .idDrink,
                                                                drinkname: snapshot
                                                                    .data!
                                                                    .userId[
                                                                        index]
                                                                    .strDrink,
                                                                image: snapshot
                                                                    .data!
                                                                    .userId[
                                                                        index]
                                                                    .picture,
                                                              );
                                                            }));
                                                          },
                                                          child: Text('Order')),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 150,
                                                  child: Image.network(
                                                    snapshot.data!.userId[index]
                                                        .picture
                                                        .toString(),
                                                    width: 100,
                                                    height: 150,
                                                  ),
                                                )
                                              ],
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
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Container(
              //           width: 300,
              //           height: 200,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.all(Radius.circular(25)),
              //             boxShadow: [
              //               BoxShadow(
              //                 color: Colors.grey.withOpacity(0.5),
              //                 spreadRadius: 5,
              //                 blurRadius: 7,
              //                 offset:
              //                     Offset(0, 3), // changes position of shadow
              //               ),
              //             ],
              //             color: Colors.white,
              //           ),
              //           alignment: Alignment.center,
              //           child: Padding(
              //             padding: const EdgeInsets.all(20.0),
              //             child: Row(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Column(
              //                   children: [
              //                     SizedBox(width: 100, child: Text("Name: ")),
              //                     Text("Id:"),
              //                   ],
              //                 ),
              //                 SizedBox(
              //                     width: 150,
              //                     child:
              //                         Image.asset('lib/images/cocktail.jpeg')),
              //               ],
              //             ),
              //           )),
              //     ],
              //   ),
              // ),
              Center(
                child: FutureBuilder<Album>(
                  future: futurenonAlbum,
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<Album> snapshot,
                  ) {
                    if (snapshot.hasData) {
                      print(snapshot.data);
                      return ListView.builder(
                          itemCount: snapshot.data!.userId.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  print(snapshot.data!.userId[index].strDrink);
                                  print(snapshot.data!.userId[index].idDrink);

                                  return Detailspage(
                                    drinkid:
                                        snapshot.data!.userId[index].idDrink,
                                    drinkname:
                                        snapshot.data!.userId[index].strDrink,
                                  );
                                }));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 300,
                                        height: 220,
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
                                                  children: [
                                                    Text("Name:"),
                                                    Text(snapshot.data!
                                                        .userId[index].strDrink
                                                        .toString())
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    children: [
                                                      // SizedBox(
                                                      //     width: 100,
                                                      //     child: Text(snapshot
                                                      //         .data!
                                                      //         .userId[index]
                                                      //         .strDrink
                                                      //         .toString())),
                                                      Row(
                                                        children: [
                                                          Text("ID:"),
                                                          Text(snapshot
                                                              .data!
                                                              .userId[index]
                                                              .idDrink
                                                              .toString()),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 150,
                                                    child: Image.network(
                                                      snapshot.data!
                                                          .userId[index].picture
                                                          .toString(),
                                                      width: 100,
                                                      height: 150,
                                                    ),
                                                  )
                                                ],
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
