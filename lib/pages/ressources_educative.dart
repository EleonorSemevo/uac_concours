

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uac_concours/constant/colors.dart';
import 'package:uac_concours/constant/strings.dart';
import 'package:uac_concours/pages/foire_question.dart';
import 'package:uac_concours/pages/partenaires.dart';
import 'package:uac_concours/pages/podcast.dart';
import 'package:uac_concours/pages/trucs_astuces.dart';

import 'authenticate.dart';
import 'home.dart';
import 'opportunities.dart';

class Resources extends StatefulWidget {


  Resources({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _ResourcesState createState() => _ResourcesState();

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
              opportunite,
              style: TextStyle(
                color: drawerTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            // subtitle: Text("follow us on facebook"),
            dense: true,
            leading: Icon(Icons.star_border,color: drawerIconColor,),
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
              Navigator.pop(context);
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
              connect,
              style: TextStyle(
                color: drawerTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            // subtitle: Text("follow us on facebook"),
            dense: true,
            leading: Icon(Icons.perm_identity,color: drawerIconColor,),
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


class _ResourcesState extends State<Resources> with TickerProviderStateMixin {

  String displayPage;

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
              text: trucs_astuces,
              icon: new Icon(Icons.book),
            ),
            new Tab(
              text: podcast,
              icon: new Icon(Icons.control_point_duplicate
              ),
            ),
            new Tab(
              text:foire_question,
              icon: new Icon(Icons.filter_center_focus
              ),
            ),
          ],
          controller: _tabController,
        ),
      ),
      drawer: widget._createDrawer(context),
      body: new TabBarView(
        children: <Widget>[
          Astuces(),
          PodCast(),
          Questions()
        ],
        controller: _tabController,
      ),

    );

    // switch(displayPage){
    //   case accueil:
    //     return Container();
    //     break;
    //   case about:
    //     return Container();
    //     break;
    //   default:
    //     return Container();
    //     break;
    // }
  }


}