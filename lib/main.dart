import 'package:e_commerce_app/home.dart';
import 'package:e_commerce_app/nav_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyNavigationBar(),
    theme: ThemeData(
      primarySwatch: Colors.green, 
    ),
  ));
}
