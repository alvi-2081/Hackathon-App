import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        leading: Icon(Icons.cut_rounded),
        title: TextField(
          decoration: InputDecoration(hintText: "Search by name or address"),
        ),
        actions: [Icon(Icons.search)],
      ),
    );
  }
}
