import 'package:flutter/material.dart';
import 'package:uac_concours/pages/home.dart';

import 'constant/colors.dart';
import 'constant/strings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UAC App',
      theme: ThemeData(
        primarySwatch: green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'UAC App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.title,
      theme: ThemeData(

        primarySwatch: green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(title: accueil,),
    );
}

}
