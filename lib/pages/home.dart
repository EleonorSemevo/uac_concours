import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uac_concours/constant/colors.dart';
import 'package:uac_concours/constant/strings.dart';
import 'package:uac_concours/pages/actuality.dart';
import 'package:uac_concours/pages/contact_us.dart';
import 'package:uac_concours/pages/galerie.dart';
import 'package:uac_concours/pages/partenaires.dart';
import 'package:uac_concours/pages/publications.dart';
import 'package:uac_concours/pages/ressources_educative.dart';

import 'authenticate.dart';
import 'opportunities.dart';

class Home extends StatefulWidget {


  Home({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _HomeState createState() => _HomeState();

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


class _HomeState extends State<Home> with TickerProviderStateMixin {

  bool showDialogue=true;

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync:this,
        length: 3);

  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<bool> onBackPress() {
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: themeColor,
        title: new Text(widget.title),
        bottom: new TabBar(
          tabs: <Tab>[
            new Tab(
              text: actuality,
              icon: new Icon(Icons.new_releases),
            ),
            new Tab(
              text: publication,
              icon: new Icon(Icons.public
              ),
            ),
            new Tab(
              text:opportunite,
              icon: new Icon(Icons.star_half),
            ),
          ],
          controller: _tabController,
        ),
      ),
      drawer: widget._createDrawer(context),
      body: new TabBarView(
        children: <Widget>[
          Actuality(),
          Publication(),
          isLogged? Opportunities():Column(

            children: [
              SizedBox(height: 200,),
              Text('You must have to sign in first.',
                style: TextStyle(fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),),
              SizedBox(height: 30,),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>Authenticate()));
                },
                child: Text(
                  "Sign In now",
                  style: TextStyle(
                      color: themeColor,
                      fontSize: 16,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          )

    ],
        controller: _tabController,
      ),

    );

  }


}