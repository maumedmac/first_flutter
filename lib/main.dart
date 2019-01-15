import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main()=> runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      title: "Primera App",
      home: RandomWords(),
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
  final _suggestion = <WordPair>[];
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenidos"),
      ),
      body: _buildSuggestion(),
    );
  }
  Widget _buildSuggestion(){
    return ListView.builder(
      itemBuilder: (context,i){
        if(i>=_suggestion.length){
          _suggestion.addAll(generateWordPairs().take(1));
        }
        return _buildRow(_suggestion[i]);
      },
    );
  }
  Widget _buildRow(WordPair pair){
    return ListTile(
      title: Text(pair.asPascalCase),
    );
  }
}