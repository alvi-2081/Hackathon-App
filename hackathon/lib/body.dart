import 'package:flutter/material.dart';
import 'login.dart';
import 'about.dart';

var product = [
  "assets/img1.jpg",
  "assets/img2.jpg",
  "assets/img3.jpg",
  "assets/img4.jpg",
  "assets/img5.png",
  "assets/img6.jpg"
];
var detail = [
  "Black T-Shirt",
  "Blue Jeans",
  "Sneakers",
  "Chaker Shirt",
  "Black Jeans",
  "Dress Shoes"
];
var price = ["50\$", "150\$", "100\$", "90\$", "250\$", "200\$"];

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.redAccent),
        title: Text(
          "Home Page",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Icon(Icons.favorite, color: Colors.redAccent),
          SizedBox(
            width: 15,
          ),
          Icon(Icons.shopping_cart, color: Colors.redAccent),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      //                            APPBAR ENDS
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: ListTile(
                leading: CircleAvatar(
                  child: Image(
                    image: AssetImage("assets/user.png"),
                  ),
                  radius: 30,
                ),
                title: Text(
                  "Username",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("abdullahalvi@gmail.com"),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Login()));
                }),
            SizedBox(
              height: 8,
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text("Cart"),
            ),
            SizedBox(
              height: 8,
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text("Favourite"),
            ),
            SizedBox(
              height: 8,
            ),
            ListTile(
                leading: Icon(Icons.info),
                title: Text("About"),
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
          Container(
              child: SizedBox(
            height: 120,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: product.length,
                itemBuilder: (context, index) {
                  return lst1(product[index], detail[index]);
                }),
          )),
          Expanded(
            child: Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: product.length,
                    itemBuilder: (context, index) {
                      return lst2(product[index], detail[index], price[index]);
                    })),
          ),
        ],
      ),
    );
  }
}

Widget lst1(String prd, String dtl) {
  return Card(
    elevation: 20,
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

Widget lst2(String prd, String dtl, String prz) {
  return InkWell(
    onTap: () {},
    child: Card(
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
                icon: Icon(Icons.volume_up),
                tooltip: 'Increase volume by 10',
                onPressed: () {},
              ),
            ),
            Positioned(
              right: 4,
              top: 4,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text("30% off", style: TextStyle(color: Colors.white)),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(color: Colors.red))))),
            ),
            Positioned(
                bottom: 30,
                right: 0,
                child: Icon(Icons.shopping_cart_outlined)),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 170,
                    height: 170,
                    child: Image(image: AssetImage(prd))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dtl,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(prz, style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
              ],
            )),
          ],
        ),
      ),
    ),
  );
}
