import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart';
import 'cart.dart';
import 'about.dart';
import 'favourite.dart';
import 'login.dart';
import 'desc.dart';

List<String> product = [
  "assets/img1.jpg",
  "assets/img2.jpg",
  "assets/img3.jpg",
  "assets/img4.jpg",
  "assets/img5.png",
  "assets/img6.jpg"
];
List<String> detail = [
  "Black T-Shirt",
  "Blue Jeans",
  "Sneakers",
  "Chaker Shirt",
  "Black Jeans",
  "Dress Shoes"
];

List<String> price = ["50\$", "150\$", "100\$", "90\$", "250\$", "200\$"];

var f_product = [];
var f_detail = [];
var f_price = [];

var c_product = [];
var c_detail = [];
var c_price = [];

var fav = [true, true, true, true, true, true];
int a = 0;

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void _toggleFavorite(int i) {
    setState(() {
      if (fav[i]) {
        fav[i] = false;
      } else {
        fav[i] = true;
      }
    });
  }

  void f_insert(int f) {
    setState(() {
      f_product.add(product[f]);
      f_detail.add(detail[f]);
      f_price.add(price[f]);
      Get.snackbar(
        'Added to Favourite', 'This Item has been Added to Favourite',
        snackPosition: SnackPosition.BOTTOM,
        // margin: EdgeInsets.only(bottom: 300)
      );
    });
  }

  void c_insert(int c) {
    setState(() {
      c_product.add(product[c]);
      c_detail.add(detail[c]);
      c_price.add(price[c]);
      a++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.redAccent,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Home Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(Favourite());
              },
              icon: Icon(Icons.favorite, color: Colors.white)),
          Badge(
            badgeColor: Colors.white,
            animationType: BadgeAnimationType.scale,
            badgeContent: Text("$a"),
            child: IconButton(
                onPressed: () {
                  Get.to(Cart());
                },
                icon: Icon(Icons.shopping_cart, color: Colors.white)),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      //                            APPBAR ENDS
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: Image.asset("assets/user.png"),
              accountName: Text("M.Abdullah Alvi"),
              accountEmail: Text("abdullah.alvi@gmail.com"),
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            ListTile(
                leading: Icon(Icons.logout, color: Colors.redAccent),
                title: Text(
                  "Logout",
                  style: TextStyle(color: Colors.redAccent),
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Login()));
                }),
            SizedBox(
              height: 8,
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart, color: Colors.redAccent),
              title: Text(
                "Cart",
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            ListTile(
              leading: Icon(Icons.favorite, color: Colors.redAccent),
              title: Text(
                "Favourite",
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            ListTile(
                leading: Icon(Icons.info, color: Colors.redAccent),
                title: Text(
                  "About",
                  style: TextStyle(color: Colors.redAccent),
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => About()));
                })
          ],
        ),
      ),
      //                                DRAWER ENDS
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 110,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: product.length,
                      itemBuilder: (context, index) {
                        return lst1(product[index], detail[index]);
                      }),
                ),
              )
            ],
          ),
          Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: product.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(Desc(), arguments: [
                          product[index],
                          detail[index],
                          price[index]
                        ]);
                      },
                      child: Card(
                        elevation: 18,
                        margin: EdgeInsets.only(
                            left: 30, right: 30, top: 10, bottom: 5),
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
                                  onPressed: () {
                                    if (fav[index] == true) {
                                      f_insert(index);
                                    } else {
                                      f_product.remove(product[index]);
                                      f_detail.remove(detail[index]);
                                      f_price.remove(price[index]);
                                      Get.snackbar('Removed to Favourite',
                                          'This Item has been Removed to Favourite',
                                          snackPosition: SnackPosition.BOTTOM);
                                    }
                                    _toggleFavorite(index);
                                  },
                                  icon: (fav[index]
                                      ? Icon(Icons.favorite_border_outlined)
                                      : Icon(Icons.favorite)),
                                  color: Colors.red[500],
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
                                            MaterialStateProperty.all(
                                                Colors.red),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                side: BorderSide(
                                                    color: Colors.red))))),
                              ),
                              Positioned(
                                  bottom: 30,
                                  right: 0,
                                  child: IconButton(
                                      onPressed: () {
                                        if (c_product
                                            .contains(product[index])) {
                                          Get.snackbar('Item Exist in the Cart',
                                              'This Item has already been Added to Cart',
                                              snackPosition:
                                                  SnackPosition.BOTTOM);
                                        } else {
                                          c_insert(index);
                                          Get.snackbar('Added to Cart',
                                              'This Item has been Added to Cart',
                                              snackPosition:
                                                  SnackPosition.BOTTOM);
                                        }
                                      },
                                      icon: Icon(Icons.shopping_cart_outlined),
                                      iconSize: 25)),
                              Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 170,
                                      height: 170,
                                      child: Image(
                                          image: AssetImage(product[index]))),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        detail[index],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text(price[index],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15))
                                    ],
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ),
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}

Widget lst1(String prd, String dtl) {
  return Card(
    elevation: 18,
    margin: EdgeInsets.all(5),
    child: Container(
      width: 250,
      padding: EdgeInsets.all(15),
      child: ListTile(
        leading: Image(
          image: AssetImage(prd),
        ),
        title: Text(dtl,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        subtitle:
            Text("10 Pieces Left", style: TextStyle(color: Colors.redAccent)),
      ),
    ),
  );
}
