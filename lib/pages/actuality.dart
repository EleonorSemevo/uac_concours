import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uac_concours/constant/colors.dart';

class Actuality extends StatefulWidget {

  Actuality({Key key,}) : super(key: key);

  @override
  _ActualityState createState() => _ActualityState();
}

class _ActualityState extends State<Actuality> {

  String displayPage;

  @override
  void initState() {
    super.initState();
  }
  getActuality() async {
    return await List(10);
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
                child:FutureBuilder(
                  future: getActuality(),
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
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.only(bottom: 5.0, top: 5.0, left:10.0,right: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              image: DecorationImage(
                image: AssetImage('assets/uac.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

                Flexible(
                  flex: 4,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/uac.jpg'),
                    ),
                    title: Text('Title'),
                    trailing:  Icon(Icons.star_border),

                    isThreeLine: true,
                    subtitle: Text('sous titre ici'),

                  ),
                ),

                Flexible(
                  flex: 10,
                  fit: FlexFit.loose,
                  child: Opacity(
                    opacity: 0.7,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),bottomRight: Radius.circular(10.0)),
                        color: Colors.grey
                      ),

                      child: Text("\t Un petit résumer de l'actualité, nous avons envisager que le résumer soit vraiment un résumer pas trop long pas trop court non plus yep!"
                          "Un petit résumer de l'actualité, nous avons envisager que le résumer soit vraiment un résumer pas trop long pas trop court non plus yep!"
                          "Un petit résumer de l'actualité, nous avons envisager que le résumer soit vraiment un résumer pas trop long pas trop court non plus yep!"
                          "Un petit résumer de l'actualité, nous avons envisager que le résumer soit vraiment un résumer pas trop long pas trop court non plus yep!"
                          "Un petit résumer de l'actualité, nous avons envisager que le résumer soit vraiment un résumer pas trop long pas trop court non plus yep!"
                          "Un petit résumer de l'actualité, nous avons envisager que le résumer soit vraiment un résumer pas trop long pas trop court non plus yep!"
                      ),

                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}
