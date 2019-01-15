import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main()=> runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final wordPair = new WordPair.random();
    return MaterialApp(
      title: "Primera App",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Bienvenidos"),
        ),
        body: Center(
          child: Text(wordPair.asPascalCase),
        ),
      ),
    );
  }
}