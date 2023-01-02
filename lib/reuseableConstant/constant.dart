import 'package:flutter/material.dart';

const Ktestfeilddecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Search by name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide.none),
);

const Kinputddecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white70,
  icon: Icon(
    Icons.location_city,
    color: Colors.blue,
  ),
  hintText: 'Full Name',
  hintStyle: TextStyle(color: Colors.blue),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide.none),
);

const Kheadingstyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);
