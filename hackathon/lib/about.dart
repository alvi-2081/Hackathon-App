import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("About"),
      ),
      body: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      child: Icon(Icons.markunread_outlined, size: 70),
                      radius: 60,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    "Drop line about us",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
                  Center(
                      child: Text(
                    "...",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ))
                ],
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Icon(
                  Icons.location_on,
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(child: Text("267 JJullian Motorway, Nazimabad, Karachi")),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                "Open Map",
                style: TextStyle(color: Colors.blue),
              )),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Icon(
                  Icons.phone_iphone,
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(child: Text("0900-78601")),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Icon(
                  Icons.timer,
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(child: Text("Monday-Friday")),
              SizedBox(
                height: 15,
              ),
              Center(child: Text("09:00-17:00")),
            ],
          ),
        ],
      ),
    );
  }
}
