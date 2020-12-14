import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uac_concours/constant/colors.dart';

class Publication extends StatefulWidget {

  Publication({Key key,}) : super(key: key);

  @override
  _PublicationState createState() => _PublicationState();
}

class _PublicationState extends State<Publication> {

  String displayPage;

  @override
  void initState() {
    super.initState();
  }
  Future getPublications() async{
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
                  future: getPublications(),
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
        return Column(
          children: <Widget>[
            Container(
              height: 30.0,
              width: double.infinity,
              color: Colors.green,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Le titre de la publication",style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
            ),
            Container(
              decoration: BoxDecoration(),
              child: Image.asset('assets/uac.jpg'),
              height: 250.0,
              width: 350.0,
            ),
            Row(
              children: <Widget>[

                Container(

                  child: Text("15/08/2020",style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                ),
                Flexible(fit: FlexFit.tight, child: SizedBox()),
                Expanded(
                  child: Icon(
                    Icons.star_border,
                    textDirection: TextDirection.rtl,
                    color: Colors.green,

                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.solid,
                        width: 2.0,
                        color: Colors.black,
                      )
                  ),
                  child: Text("15"),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20.0),

              child: Container(
                width: double.infinity,
                child: Text('le texte de la publication ici est un truc de nombreuse truc '
                    'le texte de la publication ici est un truc de nombreuse truc '
                    'le texte de la publication ici est un truc de nombreuse truc '
                    'le texte de la publication ici est un truc de nombreuse truc ',
                ),
              ),

            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                //border: Border.all()
              ),
            )
          ],
        );
      },
    );

  }
}
