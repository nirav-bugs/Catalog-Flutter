import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var idk = "flutter";
    return Scaffold(
      appBar: AppBar(
        title: Text("Nirav First app"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to Bugs first $idk App"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
