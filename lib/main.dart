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
  final _saved = Set<WordPair>();
  final _biggerfont = const TextStyle(fontSize: 18.0);
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenidos"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.list),
              onPressed: _pushSaved
          )
        ],
      ),
      body: _buildSuggestion(),
    );
  }
  void _pushSaved ()
  {
    Navigator.of(context).push(MaterialPageRoute( builder: (context){
      final tiles = _saved.map((pair){
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: _biggerfont,
          ),

        );
      });

      final divided = ListTile.divideTiles(
        context: context,
        tiles: tiles,
      ).toList();
      return Scaffold(
        appBar: AppBar(
          title: Text("Sugerencias"),
        ),
        body: ListView(
          children: divided ,
          padding: const EdgeInsets.all(16.0),
        ),
      );

    }));
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
    final alreadySaved = _saved.contains(pair);

    return ListTile(
      title: Text(pair.asPascalCase,
      style: _biggerfont,),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: (){
        setState(() {
          if(alreadySaved)
            _saved.remove(pair);
          else
            _saved.add(pair);
        });
      },
    );
  }
}