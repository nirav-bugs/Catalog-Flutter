import 'package:flutter/material.dart';
import 'package:myfirstproject/pages/login.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      // system mode
      themeMode: ThemeMode.light,
      // below on light mode
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      // specs for dark modes
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      routes: {
        // "/":(context)=>HomePage(),
        // "/login":(context)=>LoginPage(),
      },
    );
  }
}
