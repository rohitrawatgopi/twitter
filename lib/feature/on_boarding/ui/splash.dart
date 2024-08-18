import 'package:flutter/material.dart';

class spalshScreen extends StatefulWidget {
  spalshScreen({super.key});

  @override
  State<spalshScreen> createState() => _spalshScreenState();
}

class _spalshScreenState extends State<spalshScreen> {
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    const Color kDarkBlueColor = Colors.blue;

    return Scaffold(
        backgroundColor: Colors.green,
        body: Stack(children: [
          Expanded(
            child: Image.asset(
              "assets/first.png",
              fit: BoxFit.cover,
            ),
          ),
        ]));
  }
}
