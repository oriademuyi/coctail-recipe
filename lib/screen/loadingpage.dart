import 'package:cocktail/model/cocktailinfo.dart';
import 'package:cocktail/model/cocktailmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class loadingpage extends StatefulWidget {
  const loadingpage({Key? key}) : super(key: key);

  @override
  State<loadingpage> createState() => _loadingpageState();
}

class _loadingpageState extends State<loadingpage> {
  Future<Album>? futureAlbum;

  // Future<Album>
  Future<Album> fetchAlbum() async {
    final response = await http.get(Uri.parse(
        'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Gin'));
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
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cocktail Recipe"),
      ),
      body: 
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
                  // futureAlbum = snapshot.data!.userId[index]. ?? 'null';
                  return 
                  
                  Column(
                    children: <Widget>[
                      Text(snapshot.data!.userId[index].idDrink.toString()),
                      Text(snapshot.data!.userId[index].strDrink.toString()),
                      Text(snapshot.data!.userId[index].strTags.toString())

                      // Widget to display the list of project
                    ],

                    // child: Column(
                    //   children: [
                    //     Text(snapshot.data!.userId.toString()),
                    //     // Text(snapshot.data!.drinkname.toString()),
                    //     // Text(snapshot.data!.Category.toString()),
                    //     // Text(snapshot.data!.Alcoholic.toString()),
                    //   ],
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
