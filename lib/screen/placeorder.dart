import 'package:flutter/material.dart';

class placeorderpage extends StatefulWidget {
  String? drinkname;
  String? drinkid;
  String? image;

  placeorderpage({this.drinkid, this.drinkname, this.image, Key? key})
      : super(key: key);

  @override
  State<placeorderpage> createState() => _placeorderpageState();
}

class _placeorderpageState extends State<placeorderpage> {
  String? pricequantity;
  void initState() {
    print(pricequantity);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          elevation: 0,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15, left: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 330,
                        child: Text(
                          widget.drinkname.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
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
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 165,
                        child: Image.network(
                          widget.image.toString(),
                          width: 100,
                          height: 150,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Container(
                        width: 162,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.blue[400],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Category",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "placeh",
                                    style: TextStyle(
                                        color: Colors.yellow, fontSize: 15),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Alcoholic",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "placeh",
                                    style: TextStyle(
                                        color: Colors.yellow, fontSize: 15),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Glass cup",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "placeh",
                                    style: TextStyle(
                                        color: Colors.yellow, fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      width: 390,
                      height: 140,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          children: [
                            Text(
                              "Price for a glass of ${widget.drinkname} ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.blue),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "\u20A6" + "2000",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 240,
                                  child: Text(
                                      "You are about to place order for ${widget.drinkname}, it will be deliver in the next 3hours"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      width: 390,
                      height: 140,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          children: [
                            Text(
                              "Buy more than a glass of ${widget.drinkname} ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.blue),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Container(
                                    width: 60,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: pricequantity == null
                                        ? Container()
                                        : Center(
                                            child: Text(
                                              "\u20A6" +
                                                  pricequantity
                                                      .toString()
                                                      .substring(6),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                SizedBox(
                                  width: 20,
                                ),
                                DropdownButton<String>(
                                  value: pricequantity,
                                  hint: Text("Quantity Needed"),
                                  items: [
                                    '1 for 2000',
                                    '2 for 4000',
                                    '3 for 6000',
                                    '4 for 8000',
                                    '5 for 10,000'
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      pricequantity = newValue;
                                    });
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                        width: 390,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Center(
                            child: Text("MAkE ORDER",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold)))),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
