import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uac_concours/constant/colors.dart';
import 'package:uac_concours/constant/strings.dart';
import 'package:uac_concours/pages/partenaires.dart';
import 'package:uac_concours/pages/ressources_educative.dart';
import 'package:uac_concours/pages/view_picture.dart';

import 'authenticate.dart';
import 'contact_us.dart';
import 'home.dart';

class Galeries extends StatefulWidget {

  final String title;
  Galeries({Key key, this.title,}) : super(key: key);

  @override
  _GaleriesState createState() => _GaleriesState();

  Drawer _createDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children:<Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/uac.jpg"),
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
            leading: Icon(Icons.home,color: drawerIconColor,),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => Home(title: accueil,)));

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
            leading: Icon(Icons.border_color,color: drawerIconColor,),
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
            leading: Icon(Icons.supervisor_account,color: drawerIconColor,),
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
            leading: Icon(Icons.contacts,color: drawerIconColor,),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => Contacts(title: contacts,)));
            },
          ),
          SizedBox(height: 16,),
          ListTile(
            title: Text(
              galerie,
              style: TextStyle(
                color: drawerTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            // subtitle: Text("follow us on facebook"),
            dense: true,
            leading: Icon(Icons.image,color: drawerIconColor,),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => Galeries(title: galerie,)));

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
            leading: Icon(Icons.error_outline,color: drawerIconColor,),
            onTap: () {
              showAboutDialog(context: context,
                  applicationName: appName,
                  children: <Widget>[
                    Text(" Redirection temporaire indique que la page visitée a temporairement changée d’adresse. Elle est annulée manuellement."),
                    Text(" Redirection temporaire indique que la page visitée a temporairement changée d’adresse. Elle est annulée manuellement."),
                    Text(" Redirection temporaire indique que la page visitée a temporairement changée d’adresse. Elle est annulée manuellement."),
                  ],
                  applicationVersion: '1.0.0',
                  applicationIcon: Image.asset('assets/logouac.jpg'),
                  applicationLegalese: 'Powered by Master Card'
              );
            },
          ),
          SizedBox(height: 16,),
          ListTile(
            title: Text(
              isLogged?disconnect:connect,
              style: TextStyle(
                color: drawerTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            // subtitle: Text("follow us on facebook"),
            dense: true,
            leading:isLogged? Icon(Icons.directions_run,color: drawerIconColor,): Icon(Icons.perm_identity,color: drawerIconColor,),
            onTap: () {
              if(isLogged)
                isLogged=false;
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
      appBar: new AppBar(
        backgroundColor: themeColor,
        title: new Text(widget.title),

      ),
      drawer: widget._createDrawer(context),
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
