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
        return Container(
          decoration: BoxDecoration(
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
                flex: 2,
                fit: FlexFit.loose,
                child: Opacity(
                  opacity: 0.7,
                  child: Container(
                    height: 40.0,
                    color: Colors.grey,
                    width: double.infinity,
                    child: Text('beaucoup de texte ici hein'),

                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}
