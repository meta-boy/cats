import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sdg_example/facts.model.dart';

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
  RandomFacts randomFactData;
  @override
  void initState() {
    randomCarUrls().then((value) {
      setState(() {
        cats = value;
      });
      randomFacts().then((value) {
        setState(() {
          randomFactData = value;
        });
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
        child: cats.isEmpty && randomFactData == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: cats.length,
                itemBuilder: (context, index) {
                  return CatCard(
                    url: cats[index].url,
                    fact: randomFactData.all[index].text,
                  );
                }),
      ),
    );
  }
}

class CatCard extends StatelessWidget {
  final String url;
  final String fact;
  const CatCard({Key key, this.url, this.fact}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(
            url,
          ),
          Text(
            fact ?? '',
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

Future<RandomFacts> randomFacts() async {
  var response = await http.get('https://cat-fact.herokuapp.com/facts');
  var body = response.body;
  final randomFactData = randomFactsFromJson(body);
  return randomFactData;
}
