import 'dart:convert';

import 'package:cocktail/model/fdcategorybynamemodel.dart';
import 'package:cocktail/screen/foodfolder/fdfurtherdrilldown.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class fdfrilldown extends StatefulWidget {
  String? categoryname;
  String? role;
  fdfrilldown({Key? key, this.categoryname, this.role}) : super(key: key);

  @override
  State<fdfrilldown> createState() => _fdfrilldownState();
}

class _fdfrilldownState extends State<fdfrilldown> {
  Future<Categorydrilldown>? foodcategorydrilldown;
  Future<Categorydrilldown>? foodlocationdrilldown;
  Future<Categorydrilldown> fetchfoodcategorydrilldwon() async {
    final response = await http.get(Uri.parse(
        'http://www.themealdb.com/api/json/v1/1/filter.php?c=${widget.categoryname}'));
    // 'https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      print(response.body);
      print(Categorydrilldown.fromJson(jsonDecode(response.body)).meals);

      return Categorydrilldown.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<Categorydrilldown> fetchfoodclocationdrilldwon() async {
    final response = await http.get(Uri.parse(
        'http://www.themealdb.com/api/json/v1/1/filter.php?a=${widget.categoryname}'));
    // 'https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      print(response.body);
      print(Categorydrilldown.fromJson(jsonDecode(response.body)).meals);

      return Categorydrilldown.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    widget.role == "category"
        ? foodcategorydrilldown = fetchfoodcategorydrilldwon()
        : foodlocationdrilldown = fetchfoodclocationdrilldwon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryname.toString())),
      body: FutureBuilder<Categorydrilldown>(
        future: widget.role == "category"
            ? foodcategorydrilldown
            : foodlocationdrilldown,
        builder: (
          BuildContext context,
          AsyncSnapshot<Categorydrilldown> snapshot,
        ) {
          if (snapshot.hasData) {
            print(snapshot.data);
            return ListView.builder(
                itemCount: snapshot.data!.meals!.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return fdfurtherdrilldown(
                          foodname:
                              snapshot.data!.meals![index].strMeal.toString(),
                        );
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, right: 30, left: 40),
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
                                              .data!.meals![index].strMeal
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
                                            // Row(
                                            //   children: [
                                            //     Text("ID:"),
                                            //     Text(snapshot
                                            //         .data!.meals![index].idMeal
                                            //         .toString()),
                                            //   ],
                                            // ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 50),
                                              child: TextButton(
                                                  onPressed: () {
                                                    // print(
                                                    //   snapshot
                                                    //       .data!
                                                    //       .userId[index]
                                                    //       .category,
                                                    // );
                                                    // Navigator.push(context,
                                                    //     MaterialPageRoute(
                                                    //         builder: (context) {
                                                    //   return placeorderpage(
                                                    //     drinkid: snapshot
                                                    //         .data!
                                                    //         .userId[index]
                                                    //         .idDrink,
                                                    //     drinkname: snapshot
                                                    //         .data!
                                                    //         .userId[index]
                                                    //         .strDrink,
                                                    //     image: snapshot
                                                    //         .data!
                                                    //         .userId[index]
                                                    //         .picture,
                                                    //   );
                                                    // }));
                                                  },
                                                  child: Text('Order')),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: 150,
                                          child: Image.network(
                                            snapshot.data!.meals![index]
                                                .strMealThumb
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
