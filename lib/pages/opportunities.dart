import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uac_concours/constant/colors.dart';
import 'package:uac_concours/constant/strings.dart';
import 'package:uac_concours/pages/postuler.dart';


import 'detailsOpportunities.dart';

class Opportunities extends StatefulWidget {


  Opportunities({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _OpportunitiesState createState() => _OpportunitiesState();

}


class _OpportunitiesState extends State<Opportunities> {



  @override
  void initState() {
    super.initState();

  }

  getOpportunities() async {
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
        return Container(
            padding: const EdgeInsets.only(bottom: 5.0, top: 5.0, left:10.0,right: 10.0),
            child: new  GestureDetector(
              onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => Postuler(title: postuler,)));
              },
                child:Column(children: [
                  Card(elevation: 5.0,
                      child: Column(
                        children: [
                          // CachedNetworkImage(
                          //   imageUrl: goodUrl(baseUrl, list[i]['url_image']),
                          //   placeholder: (context, url) => new CircularProgressIndicator(),
                          //   errorWidget: (context, url, error) => Image.asset('assset/net2all.jpg')
                          // ),
                          Material(
                            child: Image.asset('assets/uac.jpg'),
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            clipBehavior: Clip.hardEdge,
                          ),
                          SizedBox(height: 5,),
                          Container(
                            child:  Row(
                              children: <Widget>[
                                new Icon(Icons.calendar_today,size: 40,
                                    color: red),
                                new Text(
                                  '23/12/2020', style: TextStyle(
                                    color: Colors.black,
                                    //fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                                ),
                                Expanded(
                                    child: Container()
                                ),
                                GestureDetector(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        gradient: LinearGradient(
                                          colors: i%2==0?[
                                            yellow,
                                            yellow
                                          ]:[
                                            red,
                                            red
                                          ],
                                        )),
                                    width: MediaQuery.of(context).size.width/3,
                                    child: Text(i%2==0?"Stage":"Emploie",
                                      style: TextStyle(color: Colors.white
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                              color: yellow,
                              width: 30.0,
                              height: 2.0,
                              margin: const EdgeInsets.symmetric(vertical: 8.0)
                          ),
                          Text('Another information',style: TextStyle(fontSize: 20,color: Colors.black),),
                          Container(
                              color: yellow,
                              width: 30.0,
                              height: 2.0,
                              margin: const EdgeInsets.symmetric(vertical: 8.0)
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (BuildContext context) => Details(title: details,)));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.green,
                                      themeColor
                                    ],
                                  )),
                              width: MediaQuery.of(context).size.width/1.2,
                              child: Text('View details',
                                style: TextStyle(color: Colors.white
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(height: 10,)
                        ],
                      )
                  )
                ]
                  ,)
            )
        );
      },
    );
  }

}
