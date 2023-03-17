import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:myfirstproject/pages/cart_page.dart';
import 'package:myfirstproject/utlis/routes.dart';
import 'package:myfirstproject/widgets/themes.dart';
import 'core/store.dart';
import 'pages/login.dart';
import 'pages/home_page.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.loginRoute,
      routes: {
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => const Cartpage(),
      },
    );
  }
}
