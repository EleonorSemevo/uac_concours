import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uac_concours/constant/colors.dart';
import 'package:uac_concours/constant/strings.dart';
import 'package:uac_concours/pages/partenaires.dart';
import 'package:uac_concours/pages/ressources_educative.dart';

import 'authenticate.dart';
import 'home.dart';

class Opportunities extends StatefulWidget {


  Opportunities({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _OpportunitiesState createState() => _OpportunitiesState();

  Drawer _createDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children:<Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/uac.jgp"),
                    fit: BoxFit.fitHeight)),
            child: Text(" "),
          ),
          Divider(
            height: 64,
            thickness: 0.5,
            color: Colors.black.withOpacity(0.5),
            indent: 32,
            endIndent: 32,
          ),
          ListTile(
            title: Text(
              accueil,
              style: TextStyle(
                color: drawerTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            // subtitle: Text("follow us on facebook"),
            dense: true,
            leading: Icon(Icons.home,color: drawerTextColor,),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => Home(title: accueil,)));

            },
          ),
          SizedBox(height: 16,),
          ListTile(
            title: Text(
              opportunite,
              style: TextStyle(
                color: drawerTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            // subtitle: Text("follow us on facebook"),
            dense: true,
            leading: Icon(Icons.star_border,color: drawerTextColor,),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => Opportunities(title: opportunite,)));

            },
          ),
          SizedBox(height: 16,),
          ListTile(
            title: Text(
              resources_educ,
              style: TextStyle(
                color: drawerTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            // subtitle: Text("follow us on facebook"),
            dense: true,
            leading: Icon(Icons.border_color,color: drawerTextColor,),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => Resources(title: resources_educ,)));
            },
          ),
          SizedBox(height: 16,),
          ListTile(
            title: Text(
              partner,
              style: TextStyle(
                color: drawerTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            // subtitle: Text("follow us on facebook"),
            dense: true,
            leading: Icon(Icons.supervisor_account,color: drawerTextColor,),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => Partner(title: partner,)));

            },
          ),
          SizedBox(height: 16,),
          ListTile(
            title: Text(
              contacts,
              style: TextStyle(
                color: drawerTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            // subtitle: Text("follow us on facebook"),
            dense: true,
            leading: Icon(Icons.contacts,color: drawerTextColor,),
            onTap: () {
              // Navigator.of(context).push(new MaterialPageRoute(
              //     builder: (BuildContext context) => Contacts(title: contacts,)));
            },
          ),
          SizedBox(height: 16,),
          ListTile(
            title: Text(
              about,
              style: TextStyle(
                color: drawerTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            // subtitle: Text("follow us on facebook"),
            dense: true,
            leading: Icon(Icons.error_outline,color: drawerTextColor,),
            onTap: () {
              // Navigator.of(context).push(new MaterialPageRoute(
              //     builder: (BuildContext context) => Home(title: accueil,)));

            },
          ),
          SizedBox(height: 16,),
          ListTile(
            title: Text(
              connect,
              style: TextStyle(
                color: drawerTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            // subtitle: Text("follow us on facebook"),
            dense: true,
            leading: Icon(Icons.perm_identity,color: drawerTextColor,),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => Authenticate()));
            },
          ),
          SizedBox(height: 16,),


          Divider(
            height: 64,
            thickness: 0.5,
            color: Colors.black.withOpacity(0.5),
            indent: 32,
            endIndent: 32,
          ),
        ],
      ),
    );

  }

}


class _OpportunitiesState extends State<Opportunities> {

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
      appBar: new AppBar(
        title: new Text(widget.title),

      ),
      drawer: widget._createDrawer(context),
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