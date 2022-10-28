import 'package:cocktail/model/cocktailinfo.dart';
import 'package:cocktail/screen/detailspage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Searchpage extends StatefulWidget {
  String? drinkname;
  Searchpage({this.drinkname, Key? key}) : super(key: key);

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  Future<Album>? futureAlbum;
  String? CityName;
  Future<Album> fetchsearch() async {
    final response = await http.get(Uri.parse(
        'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=${widget.drinkname.toString()}'));
    // 'https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      print(response.body);
      print(Album.fromJson(jsonDecode(response.body)).userId);

      // print(futureAlbum);

      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchsearch();
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
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        print(snapshot.data!.userId[index].strDrink);
                        print(snapshot.data!.userId[index].idDrink);

                        return Detailspage(
                          drinkid: snapshot.data!.userId[index].idDrink,
                          drinkname: snapshot.data!.userId[index].strDrink,
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
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Row(
                                        children: [
                                          Text("Name:"),
                                          Text(snapshot
                                              .data!.userId[index].strDrink
                                              .toString())
                                        ],
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                                    .data!.userId[index].idDrink
                                                    .toString()),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 150,
                                          child: Image.network(
                                            snapshot.data!.userId[index].picture
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
    );
  }
}
