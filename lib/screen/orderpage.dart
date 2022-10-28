import 'package:cocktail/reuseableConstant/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class Orderpage extends StatefulWidget {
  String? drinkname;
  String? drinkid;
  Orderpage({this.drinkid, this.drinkname, Key? key}) : super(key: key);

  @override
  State<Orderpage> createState() => _OrderpageState();
}

class _OrderpageState extends State<Orderpage> {
  String? FullName;
  String? DeliveryAddress;
  String? PhoneNumber;
  String? DeliveryDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Place order for ${widget.drinkname}'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.center,
              child: TextField(
                style: TextStyle(color: Colors.black),
                decoration: Kinputddecoration,
                onChanged: (value) {
                  FullName = value;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.center,
              child: TextField(
                style: TextStyle(color: Colors.black),
                decoration: Kinputddecoration.copyWith(
                  hintText: "Delivery Address",
                  icon: Icon(
                    Icons.dns,
                    color: Colors.black,
                  ),
                ),
                onChanged: (value) {
                  DeliveryAddress = value;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.center,
              child: TextField(
                style: TextStyle(color: Colors.black),
                decoration: Kinputddecoration.copyWith(
                  hintText: "Phone Number",
                  icon: Icon(
                    Icons.phone,
                    color: Colors.black,
                  ),
                ),
                onChanged: (value) {
                  PhoneNumber = value;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.center,
              child: TextField(
                style: TextStyle(color: Colors.black),
                decoration: Kinputddecoration.copyWith(
                  hintText: "Delivery Date",
                  icon: Icon(
                    Icons.calendar_today,
                    color: Colors.black,
                  ),
                ),
                onChanged: (value) {
                  DeliveryDate = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 70),
              child: Container(
                  width: 310,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: TextButton(
                      onPressed: () {
                        print(FullName);
                        print(DeliveryAddress);
                        print(PhoneNumber);
                        print(DeliveryDate);
                      },
                      child: Text(
                        'Confirm My Order',
                        style: TextStyle(color: Colors.white),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
