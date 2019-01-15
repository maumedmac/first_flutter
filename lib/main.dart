import 'package:flutter/material.dart';
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
          child: Text("Hola Platzi!!!"),
        ),
      ),
    );
  }
}