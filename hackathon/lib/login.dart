import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hackathon/navbar.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController pwd = TextEditingController();

  var input = "";

  dialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Wrong Password"),
            content: Text("Re-enter Password"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Ok",
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        title: Text(
          "Login",
          style:
              TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w700),
        ),
      ),
      //                          AppBar Ends
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    image: AssetImage("assets/cart.gif"),
                    width: MediaQuery.of(context).size.width,
                    height: 250),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: "Username",
                      hintStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          gapPadding: 10,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          gapPadding: 10,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: TextField(
                    controller: pwd,
                    onChanged: (value) {
                      input = value;
                    },
                    obscureText: true,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          gapPadding: 10,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          gapPadding: 10,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 38,
                  child: ElevatedButton(
                    onPressed: () {
                      if (input == "123456") {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Navbar()));
                      } else {
                        setState(() {
                          dialog();
                        });
                        pwd.clear();
                      }
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.login_outlined,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Login",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    side: BorderSide(
                                        color: Colors.black, width: 2.3)))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    child: Text(
                  "Not have an Account? Register.",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
