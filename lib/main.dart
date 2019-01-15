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
  final _biggerfont = const TextStyle(fontSize: 18.0);
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
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context,i){
        if(i.isOdd)return Divider(color: Colors.black,);
        if(i>=_suggestion.length){
          _suggestion.addAll(generateWordPairs().take(1));
        }
        final index = i~/2;
        return _buildRow(_suggestion[index]);
      },
    );
  }
  Widget _buildRow(WordPair pair){
    return ListTile(
      title: Text(pair.asPascalCase,
      style: _biggerfont,),
    );
  }
}