import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uac_concours/constant/colors.dart';

class PodCast extends StatefulWidget {

  PodCast({Key key,}) : super(key: key);

  @override
  _PodCastState createState() => _PodCastState();
}

class _PodCastState extends State<PodCast> {

  String displayPage;

  @override
  void initState() {
    super.initState();
  }
  getOpportunities(){
    return null;
  }
  Future<bool> onBackPress() {
    exit(0);
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: WillPopScope(
        child: Stack(
          children: <Widget>[
            Container(
                child:FutureBuilder<List>(
                  future: getOpportunities(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? buildItemList(context,snapshot.data)
                        : new Center(
                      child: new CircularProgressIndicator(),
                    );
                  },
                )
            ),

          ],
        ),
        onWillPop: onBackPress,
      ),

    );
  }
  Widget buildItemList(BuildContext context,List list) {
    return  ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.only(bottom: 5.0, top: 5.0, left:10.0,right: 10.0),
          child: new GestureDetector(
            onTap: ()  {

            },

            child: new Card(
              elevation: 8.0,
              child: new ListTile(
                title: new Text(
                  "", // column name in the table
                  style: TextStyle(
                      color: themeColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                subtitle: Text(
                  "", // column name in the table
                  style: TextStyle(
                      color: themeColor),
                ),

              ), // column name in the table
            ),
          ),
        );
      },
    );
  }

}
