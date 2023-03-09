import "package:flutter/material.dart";
import "../widgets/drawer.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var idk = "flutter";
    return Scaffold(
      appBar: AppBar(
        title: const Text("BUGS app"),
      ),
      body: Center(
        child: Text("Welcome to Bugs first $idk App"),
      ),
      drawer: const MyDrawer(),
    );
  }
}
