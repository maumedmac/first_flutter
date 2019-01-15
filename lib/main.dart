import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main()=> runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      title: "Primera App",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Bienvenidos"),
        ),
        body: Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}
class RandomWords extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RandomWordsState();
  }
}
class RandomWordsState extends State<RandomWords>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final wordPair = new WordPair.random();
    return Text(wordPair.asPascalCase);
  }
}