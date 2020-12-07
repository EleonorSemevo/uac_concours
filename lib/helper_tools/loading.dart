import 'package:flutter/material.dart';
import 'package:uac_concours/constant/colors.dart';
import 'package:uac_concours/constant/strings.dart';
import 'package:uac_concours/pages/authenticate.dart';
import 'package:uac_concours/pages/home.dart';
import 'package:uac_concours/pages/opportunities.dart';
import 'package:uac_concours/pages/partenaires.dart';
import 'package:uac_concours/pages/ressources_educative.dart';



class Loading extends StatelessWidget {
  final int cas;
  const Loading(this.cas);

  //cas = 0 all screen
  //cas = 1 pop up

  @override
  Widget build(BuildContext context) {
    return cas==0? Container(
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(themeColor),
        ),
      ),
      color: Colors.white.withOpacity(0.8),
    )
    :cas==1?AlertDialog(
      content:  LinearProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(themeColor),
      ),)
    :Container();
  }
}

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
