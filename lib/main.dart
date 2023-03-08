import 'package:flutter/material.dart';
import 'package:myfirstproject/pages/login.dart';
import 'pages/home_page.dart';
import "./utlis/routes.dart";

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
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}
