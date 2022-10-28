import 'package:flutter/material.dart';

const Ktestfeilddecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  // icon: Icon(
  //   Icons.location_city,
  //   color: Colors.white,
  // ),
  hintText: 'Enter Cocktail Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide.none),
);

const Kinputddecoration = InputDecoration(
  filled: true,
  fillColor: Colors.grey,
  icon: Icon(
    Icons.location_city,
    color: Colors.black,
  ),
  hintText: 'Full Name',
  hintStyle: TextStyle(color: Colors.black),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide.none),
);

const Kheadingstyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);
