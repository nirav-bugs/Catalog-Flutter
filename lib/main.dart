import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var idk = "flutter";
    return MaterialApp(
      home: Material(
        child: Center(
          child: Container(
            child: Text("Welcome to Bugs first $idk App"),
          ),
        ),
      ),
    );
  }
}
