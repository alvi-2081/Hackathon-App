import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Desc extends StatefulWidget {
  const Desc({Key? key}) : super(key: key);

  @override
  _DescState createState() => _DescState();
}

class _DescState extends State<Desc> {
  var data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Description"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                margin: EdgeInsets.all(20),
                child: Image.asset(data[0]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(data[1],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text(data[2],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "This Product is Amazing and great to wear.Comfortable to wear in every season and in every fashion.This Product is Amazing and great to wear.Comfortable to wear in every season and in every fashionThis Product is Amazing and great to wear.",
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
