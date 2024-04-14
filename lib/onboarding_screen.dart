import 'dart:async';

import 'package:flutter/material.dart';
import 'package:e_commerce_app/nav_bar.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<String> images = [
    'https://i.pinimg.com/474x/0a/8e/51/0a8e51d876088785647772c7d3b22d3f.jpg',
    'https://i.pinimg.com/474x/e8/2f/73/e82f73308df857b36646772da14af1de.jpg',
    'https://i.pinimg.com/474x/5f/d9/f9/5fd9f9d6127dcfa210bbf210e2831134.jpg',
    'https://i.pinimg.com/564x/57/14/14/5714143d57d121bf3f79990bd0d1f470.jpg',
    'https://i.pinimg.com/564x/7b/3f/c7/7b3fc721c2bf512205176d7affd33f5c.jpg',
    'https://i.pinimg.com/564x/a3/c7/29/a3c729ca13146e7b036d07331733eb40.jpg',
  ];

  final PageController _controller = PageController(
    initialPage: 0,
    viewportFraction: 1.0,
  );

  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % images.length;
        _controller.animateToPage(
          _currentIndex,
          duration: Duration(milliseconds: 1000),
          curve: Curves.ease,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://i.pinimg.com/474x/50/9f/ee/509fee41d0dc7e9e7e71fdfd6a608463.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: PageView.builder(
              controller: _controller,
              itemCount: images.length, // Remove +1 for looping
              itemBuilder: (context, index) {
                final actualIndex = index % images.length;
                return Image.network(
                  images[actualIndex],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Positioned(
            bottom: 50,
            left: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyNavigationBar()));
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // Rounded corners
                ),
              ),
              child: Container(
                width: double.infinity, // Full width
                padding: EdgeInsets.symmetric(vertical: 10), // Button padding
                child: Center(
                    child: Text(
                  'Start',
                  style: TextStyle(fontSize: 20),
                )), // Button text
              ),
            ),
          ),
        ],
      ),
    );
  }
}
