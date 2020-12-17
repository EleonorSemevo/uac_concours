import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uac_concours/constant/colors.dart';

class Postuler extends StatefulWidget {

  final String title;
  Postuler({Key key, this.title,}) : super(key: key);

  @override
  _PostulerState createState() => _PostulerState();
}

class _PostulerState extends State<Postuler> {


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: themeColor,
        title: new Text(widget.title),

      ),
      body: WillPopScope(
        child: Stack(
          children: <Widget>[
           Center(
             child: Text('We going to collect some information about stage or job',
               style: TextStyle(fontSize: 20,
               fontWeight: FontWeight.bold,
               fontStyle: FontStyle.italic),),
           )

          ],
        ),

      ),

    );
  }


}
