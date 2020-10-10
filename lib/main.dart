import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'cats.model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OurList(),
    );
  }
}

class OurList extends StatefulWidget {
  @override
  _OurListState createState() => _OurListState();
}

class _OurListState extends State<OurList> {
  List<RandomCats> cats = [];
  @override
  void initState() {
    randomCarUrls().then((value) {
      setState(() {
        cats = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cats APP!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: cats.isEmpty ? Center(
          child: CircularProgressIndicator(),
        ): ListView.builder(
            itemCount: cats.length,
            itemBuilder: (context, index) {
              return CatCard(
                url: cats[index].url,
              );
            }),
      ),
    );
  }
}

class CatCard extends StatelessWidget {
  final String url;

  const CatCard({Key key, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(
            url,
          ),
          Text(
            'The world\'s largest cat measured 48.5 inches long.',
            style: TextStyle(fontSize: 24.0),
          )
        ],
      ),
    );
  }
}

Future<List<RandomCats>> randomCarUrls() async {
  var response =
      await http.get('https://api.thecatapi.com/v1/images/search?limit=100');
  var body = response.body;
  final randomCats = randomCatsFromJson(body);
  return randomCats;
}
