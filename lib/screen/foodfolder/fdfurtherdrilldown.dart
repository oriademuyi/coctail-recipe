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

  @override
  Widget build(BuildContext context) {
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
    Future<Fddetailsmodel> fetchfooddetails() async {
      final response = await http.get(Uri.parse(
          'http://www.themealdb.com/api/json/v1/1/search.php?s=${widget.foodname}'));
      // 'https://jsonplaceholder.typicode.com/albums/1'));

      if (response.statusCode == 200) {
        print("pass");
        print(response.body);
        print(widget.foodname);
        print(Fddetailsmodel.fromJson(jsonDecode(response.body)).foodname);

        return Fddetailsmodel.fromJson(jsonDecode(response.body));
      } else {
        print("failed");
        print(widget.foodname);
        throw Exception('Failed to load album');
      }
    }
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
      // fetchfooddetails();
      fooddrilldown = fetchfooddetails();
    }

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
                              Text("${snapshot.data!.foodname()}"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Drink Id:"),
                              Text("${snapshot.data!.foodId}"),
                            ],
                          ),
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
                              Text("Alcoholic:"),
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
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text(snapshot.data!.userId[index].ingredient1
                          //         .toString()),
                          //     Text(snapshot.data!.userId[index].measurement1
                          //         .toString()),
                          //   ],
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text(snapshot.data!.userId[index].ingredient2
                          //         .toString()),
                          //     Text(snapshot.data!.userId[index].measurement1
                          //         .toString()),
                          //   ],
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text(snapshot.data!.userId[index].ingredient3
                          //         .toString()),
                          //     Text(snapshot.data!.userId[index].measurement1
                          //         .toString()),
                          //   ],
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text(snapshot.data!.userId[index].ingredient4
                          //         .toString()),
                          //     Text(snapshot.data!.userId[index].measurement1
                          //         .toString()),
                          //   ],
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text(snapshot.data!.userId[index].ingredient5
                          //         .toString()),
                          //     Text(snapshot.data!.userId[index].measurement1
                          //         .toString()),
                          //   ],
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 20, bottom: 20),
                          //   child: Container(
                          //       width: 350,
                          //       height: 40,
                          //       color: Colors.blue,
                          //       alignment: Alignment.center,
                          //       child: Text(
                          //         "Recipe",
                          //         style: Kheadingstyle,
                          //       )),
                          // ),
                          // Text(snapshot.data!.userId[index].instruction
                          //     .toString()),
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
      ),
    );
  }
}
