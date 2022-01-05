import 'package:flutter/material.dart';
import 'body.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Row(
          children: [
            Text("Cart"),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.shopping_cart_outlined)
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: c_product.length,
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
                    Positioned(
                      bottom: 25,
                      left: 0,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Check Out",
                              style: TextStyle(color: Colors.white)),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.indigo[900]),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side:
                                          BorderSide(color: Colors.indigo))))),
                    ),
                    Positioned(
                      bottom: 30,
                      right: 0,
                      child: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            c_product.remove(c_product[index]);
                            c_price.remove(c_price[index]);
                            c_detail.remove(c_detail[index]);
                            --a;
                          });
                        },
                      ),
                    ),
                    Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 170,
                            height: 170,
                            child: Image(image: AssetImage(c_product[index]))),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              c_detail[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(c_price[index],
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
