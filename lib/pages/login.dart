import "package:flutter/material.dart";
import "package:myfirstproject/utlis/routes.dart";

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
          child: Column(
        children: [
          Image.asset(
            "assets/images/loginimg.png",
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 20.0,

            // things to preview in above height : written at bottom chid
            // child:Text("data") ,
          ),
          const Text(
            "Welcome",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // below for left right same
          // Padding(padding: const EdgeInsets.all(16.0),
          // for different from left to right
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter Username",
                    labelText: "Username",
                  ),
                ),
                TextFormField(
                  // below for encoded password:***
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.homeRoute);
                  },
                  style: TextButton.styleFrom(minimumSize: Size(100, 35)),
                  child: Text("Login"),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
