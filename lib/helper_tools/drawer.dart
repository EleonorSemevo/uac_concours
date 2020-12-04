import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uac_concours/constant/strings.dart';
import 'package:uac_concours/constant/colors.dart';

class Drawers {

 static Drawer _createDrawer(BuildContext context) {
   return Drawer(
     child: ListView(
       children:<Widget>[

         DrawerHeader(
           decoration: BoxDecoration(
               image: DecorationImage(
                   image: AssetImage("assets/woo.png"),
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
               color: themeColor,
               fontWeight: FontWeight.bold,
               fontSize: 20,
             ),
           ),
           // subtitle: Text("follow us on facebook"),
           dense: true,
           leading: Icon(Icons.star_border,color: themeColor,),
           onTap: () {

           },
         ),
         SizedBox(height: 16,),
         ListTile(
           title: Text(
             about,
             style: TextStyle(
               color: themeColor,
               fontWeight: FontWeight.bold,
               fontSize: 20,
             ),
           ),
           // subtitle: Text("follow us on facebook"),
           dense: true,
           leading: Icon(Icons.star_border,color: themeColor,),
           onTap: () {

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