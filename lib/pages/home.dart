import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uac_concours/constant/colors.dart';
import 'package:uac_concours/constant/strings.dart';

class Home extends StatefulWidget {

  Home({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _HomeState createState() => _HomeState();

}


class _HomeState extends State<Home> {

  String displayPage;


  Future<bool> onBackPress() {
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {

    switch(displayPage){
      case accueil:
        return Container();
        break;
      case about:
        return Container();
        break;
      default:
        return Container();
        break;
    }
  }


}