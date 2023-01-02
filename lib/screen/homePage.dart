import 'package:cocktail/reuseableConstant/constant.dart';
import 'package:cocktail/screen/foodfolder/fdwelcom.dart';
import 'package:cocktail/screen/search.dart';
import 'package:cocktail/screen/welcomepage.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  bool _showFirstImage = true;
  int _currentImageIndex = 0;
  List<String> _imagePaths = [
    'assets/foodrecipe.jpeg',
    "assets/realcocktail3.webp",
    'assets/food2.webp',
    "assets/realcocktail4.jpeg",
    'assets/foodrecipe.jpeg',
    "assets/beef1.jpeg",
    "assets/realcocktail1.jpeg",
    "assets/breakfast.webp",
    "assets/realcocktail2.jpeg",
    "assets/chicken1.jpeg",
    "assets/realcocktail3.webp",
    "assets/desset.jpeg",
    "assets/realcocktail4.jpeg",
    "assets/goat.jpeg",
  ];
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    //   _timer = Timer.periodic(Duration(seconds: 1), (timer) {
    //     setState(() {
    //       _showFirstImage = !_showFirstImage;
    //     });
    //   });
    // }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentImageIndex = (_currentImageIndex + 1) % _imagePaths.length;
      });
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Image.asset('assets/foodrecipe.jpeg').color,
      appBar: AppBar(
        title: Text("Recipes"),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Menu Icon',
          onPressed: () {},
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Latest food/drink recipes"),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Image.asset(
                _imagePaths[_currentImageIndex],
                width: 300,
                height: 300,
              ),
              // ClipOval(
              //   child: _showFirstImage
              //       ? Image.asset(
              //           // 'assets/foodrecipe.jpeg',
              //           'assets/food2.webp',
              //           width: 300,
              //           height: 300,
              //         )
              //       : Image.asset(
              //           // 'assets/foodrecipe.jpeg',
              //           'assets/coctail.jpeg',
              //           width: 300,
              //           height: 300,
              //         ),
              // ),
            ),
            SizedBox(
              height: 50,
            ),
            Text("Quick and Easy"),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const welcomepage()),
                );
              },
              child: Container(
                  padding: const EdgeInsets.only(
                      left: 35, right: 35, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/drink1.jpeg',
                          width: 60,
                          height: 60,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Cocktail Recipe",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            "search,view and order",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "4.8",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 15.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const fdwelcomepage()),
                );
              },
              child: Container(
                  padding: const EdgeInsets.only(
                      left: 35, right: 35, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/foodrecipe.jpeg',
                          width: 60,
                          height: 60,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Food Recipe",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            "search,view and order",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "4.8",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 15.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
