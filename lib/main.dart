import 'package:e_commerce_app/home.dart';
import 'package:e_commerce_app/nav_bar.dart';
import 'package:e_commerce_app/onboarding_screen.dart';
import 'package:e_commerce_app/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: AnimatedSplashScreen(),
//home: OnboardingScreen(), 
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
  ));
}
