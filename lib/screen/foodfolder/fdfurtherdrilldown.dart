import 'dart:convert';

import 'package:cocktail/model/fddetailsmodel.dart';
import 'package:cocktail/reuseableConstant/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class fdfurtherdrilldown extends StatefulWidget {
  String? foodname;
  fdfurtherdrilldown({Key? key, this.foodname}) : super(key: key);

  @override
  State<fdfurtherdrilldown> createState() => _fdfurtherdrilldownState();
}

class _fdfurtherdrilldownState extends State<fdfurtherdrilldown> {
  Future<Fddetailsmodel>? fooddrilldown;
  Future<Fddetailsmodel> fetchfooddetails() async {
    final response = await http.get(Uri.parse(
        'http://www.themealdb.com/api/json/v1/1/search.php?s=${widget.foodname}'));
    // 'http://www.themealdb.com/api/json/v1/1/search.php?s=Beef Lo Mein'));

    // 'https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      print("pass");
      print(response.body);
      print(widget.foodname);
      print(Fddetailsmodel.fromJson(jsonDecode(response.body)));

      return Fddetailsmodel.fromJson(jsonDecode(response.body));
    } else {
      print("failed");
      print(widget.foodname);
      throw Exception('Failed to load album');
    }
  }
  // Future<Fddetailsmodel>? futureAlbum;
  // Future<Fddetailsmodel> fetchfooddetails() async {
  //   final response = await http.get(Uri.parse(
  //       'https://www.themealdb.com/api/json/v1/1/search.php?s=Potatoes'));
  //   // 'https://jsonplaceholder.typicode.com/albums/1'));

  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     print("object")
  //     print(Fddetailsmodel.fromJson(jsonDecode(response.body)));

  //     return Fddetailsmodel.fromJson(jsonDecode(response.body));
  //   } else {
  //     print(response.body);

  //     throw Exception('Failed to load album');
  //   }
  // }

  // fetchfooddetails() async {
  //   final response = await http.get(Uri.parse(
  //       'http://www.themealdb.com/api/json/v1/1/search.php?s=${widget.foodname}'));
  //   // 'https://jsonplaceholder.typicode.com/albums/1'));

  //   if (response.statusCode == 200) {
  //     print("pass");
  //     print(response.body);
  //     print(widget.foodname);

  //     // print(Fddetailsmodel.fromJson(jsonDecode(response.body)).foodname);

  //     // return Fddetailsmodel.fromJson(jsonDecode(response.body));
  //   } else {
  //     print("failed");
  //     print(widget.foodname);
  //     throw Exception('Failed to load album');
  //   }
  // }
  @override
  void initState() {
    super.initState();
    print("the foodname${widget.foodname}");
    fetchfooddetails();

    fooddrilldown = fetchfooddetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.foodname.toString()),
      ),
      body: InkWell(
        onTap: () {
          // fetchfooddetails();
        },
        child: FutureBuilder<Fddetailsmodel>(
          future: fooddrilldown,
          builder: (
            BuildContext context,
            AsyncSnapshot<Fddetailsmodel> snapshot,
          ) {
            if (snapshot.hasData) {
              print(snapshot.data);
              return ListView.builder(
                  itemCount: snapshot.data!.foodId.length,
                  itemBuilder: (BuildContext context, int index) {
                    // futureAlbum = snapshot.data!.userId[index]. ?? 'null';
                    return Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            width: 300,
                            child: Image.network(
                              snapshot.data!.Picture,
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
                              // Text("${snapshot.data!.foodname!()}"),
                              Text(widget.foodname.toString()),
                            ],
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text("Drink Id:"),
                          //     Text("${snapshot.data!.foodId}"),
                          //   ],
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Category:"),
                              Text("${snapshot.data!.Category}"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Location:"),
                              Text("${snapshot.data!.strAre}"),
                            ],
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text("Glass Type:"),
                          //     Text(
                          //         "${snapshot.data!.userId[index].Glasstype.toString()}"),
                          //   ],
                          // ),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(snapshot.data!.foodId[0].ingredient1
                                  .toString()),
                              Text(snapshot.data!.foodId[0].measurement1
                                  .toString()),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(snapshot.data!.foodId[0].ingredient2
                                  .toString()),
                              Text(snapshot.data!.foodId[0].measurement2
                                  .toString()),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(snapshot.data!.foodId[0].ingredient3
                                  .toString()),
                              Text(snapshot.data!.foodId[0].measurement3
                                  .toString()),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(snapshot.data!.foodId[0].ingredient4
                                  .toString()),
                              Text(snapshot.data!.foodId[0].measurement4
                                  .toString()),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(snapshot.data!.foodId[0].ingredient5
                                  .toString()),
                              Text(snapshot.data!.foodId[0].measurement5
                                  .toString()),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(snapshot.data!.foodId[0].ingredient6
                                  .toString()),
                              Text(snapshot.data!.foodId[0].measurement6
                                  .toString()),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(snapshot.data!.foodId[0].ingredient7
                                  .toString()),
                              Text(snapshot.data!.foodId[0].measurement7
                                  .toString()),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(snapshot.data!.foodId[0].ingredient8
                                  .toString()),
                              Text(snapshot.data!.foodId[0].measurement8
                                  .toString()),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(snapshot.data!.foodId[0].ingredient9
                                  .toString()),
                              Text(snapshot.data!.foodId[0].measurement9
                                  .toString()),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(snapshot.data!.foodId[0].ingredient10
                                  .toString()),
                              Text(snapshot.data!.foodId[0].measurement10
                                  .toString()),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(snapshot.data!.foodId[0].ingredient11
                                  .toString()),
                              Text(snapshot.data!.foodId[0].measurement11
                                  .toString()),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(snapshot.data!.foodId[0].ingredient12
                                  .toString()),
                              Text(snapshot.data!.foodId[0].measurement12
                                  .toString()),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(snapshot.data!.foodId[0].ingredient13
                                  .toString()),
                              Text(snapshot.data!.foodId[0].measurement13
                                  .toString()),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(snapshot.data!.foodId[0].ingredient14
                                  .toString()),
                              Text(snapshot.data!.foodId[0].measurement14
                                  .toString()),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(snapshot.data!.foodId[0].ingredient15
                                  .toString()),
                              Text(snapshot.data!.foodId[0].measurement15
                                  .toString()),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(snapshot.data!.foodId[0].ingredient16
                                  .toString()),
                              Text(snapshot.data!.foodId[0].measurement16
                                  .toString()),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(snapshot.data!.foodId[0].ingredient17
                                  .toString()),
                              Text(snapshot.data!.foodId[0].measurement17
                                  .toString()),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(snapshot.data!.foodId[0].ingredient18
                                  .toString()),
                              Text(snapshot.data!.foodId[0].measurement18
                                  .toString()),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(snapshot.data!.foodId[0].ingredient19
                                  .toString()),
                              Text(snapshot.data!.foodId[0].measurement19
                                  .toString()),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(snapshot.data!.foodId[0].ingredient20
                                  .toString()),
                              Text(snapshot.data!.foodId[0].measurement20
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
                          Text(snapshot.data!.strInstructions.toString()),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: Container(
                                width: 350,
                                height: 40,
                                color: Colors.blue,
                                alignment: Alignment.center,
                                child: Text(
                                  "Materials",
                                  style: Kheadingstyle,
                                )),
                          ),
                          Column(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Youtube",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    snapshot.data!.yotube == null
                                        ? "no youtube link for this food"
                                        : snapshot.data!.yotube,
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Source",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    snapshot.data!.source == null
                                        ? "no source material for this food"
                                        : snapshot.data!.source,
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  });
            } else {
              print(" my data${snapshot.data}");
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
      ),
    );
  }
}
