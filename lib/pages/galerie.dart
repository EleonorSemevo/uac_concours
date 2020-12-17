import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uac_concours/constant/colors.dart';
import 'package:uac_concours/pages/view_picture.dart';

class Galeries extends StatefulWidget {

  Galeries({Key key,}) : super(key: key);

  @override
  _GaleriesState createState() => _GaleriesState();
}

class _GaleriesState extends State<Galeries> {

  String displayPage;

  @override
  void initState() {
    super.initState();
  }
  getOpportunities() async{
    List<String> result = [];
    for(int i=0; i<16; i++)
      result.add("assets/uac.jpg");
    return await result;
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
    return GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 0.0,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: List<Container>.generate(
              list.length, (int index) =>
              Container(child:
               GestureDetector(
                 onTap: ()  {
                   Navigator.of(context).push(new MaterialPageRoute(
                       builder: (BuildContext context) => ViewPicture(imgList: list,
                       initial: index,)));
                 }
                 ,
                 child: Card(
                 elevation: 1.0,
                 margin: EdgeInsets.all(5.0),
                 child:
                 Image.asset(
                   list[index],
                 ),
               ),)
              ),
          )
    );
  }

}
