import "dart:ffi";

import "package:flutter/material.dart";
import "package:myfirstproject/utlis/routes.dart";

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changebtn = false;
  final _formkey = GlobalKey<FormState>();
  movetoHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebtn = true;
      });

      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changebtn = false;
      });
    }
    ;
  }

  bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
          child: Form(
        key: _formkey,
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
            Text(
              "Welcome $name",
              style: const TextStyle(
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username can't be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      name = value;
                      // below change page means refresh
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    // below for encoded password:***
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password can't be empty";
                      } else if (value.length < 6) {
                        return "Password length must be of atleast 6 ";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(changebtn ? 20 : 7),
                    child: InkWell(
                      onTap: () => {movetoHome(context)},
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: changebtn ? 50 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        // decoration: BoxDecoration(
                        //   // shape: changebtn ? BoxShape.circle : BoxShape.rectangle,
                        //   color: Colors.deepPurple,
                        // ),
                        child: changebtn
                            ? const Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : const Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                      ),
                    ),
                  )
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //   },
                  //   style: TextButton.styleFrom(minimumSize: const Size(100, 35)),
                  //   child: const Text("Login"),
                  // ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
