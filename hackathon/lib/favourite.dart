import 'package:flutter/material.dart';
import 'body.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Favourite"),
      ),
      body: ListView.builder(
          itemCount: f_product.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 20,
              margin: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 5),
              child: Container(
                padding: EdgeInsets.all(12),
                height: 350,
                width: 300,
                child: Stack(
                  children: [
                    Positioned(
                      left: 3,
                      top: 3,
                      child: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            f_product.removeAt(f_product[index]);
                          });
                        },
                      ),
                    ),
                    Positioned(
                      right: 4,
                      top: 4,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text("30% off",
                              style: TextStyle(color: Colors.white)),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: Colors.red))))),
                    ),
                    Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 170,
                            height: 170,
                            child: Image(image: AssetImage(f_product[index]))),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              f_detail[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(f_price[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18))
                          ],
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
