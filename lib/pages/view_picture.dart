import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uac_concours/constant/colors.dart';
import 'package:uac_concours/constant/strings.dart';
import 'package:uac_concours/pages/galerie.dart';

class ViewPicture extends StatefulWidget {

  final List imgList;
  final int initial;

  ViewPicture({Key key, this.imgList, this.initial,}) : super(key: key);

  @override
  _ViewPictureState createState() => _ViewPictureState();
}

class _ViewPictureState extends State<ViewPicture> {
  bool backgroundColor=true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: themeColor,
        title: new Text(galerie),

      ),
      backgroundColor: backgroundColor? Colors.white:Colors.black,
      body: WillPopScope(
        child: Stack(
          children: <Widget>[
            Center(child: CarouselSlider(
              options: CarouselOptions(height: MediaQuery.of(context).size.height,
              initialPage: widget.initial),
              items: widget.imgList.map((imgUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: (){
                        setState(() {
                          backgroundColor=!backgroundColor;
                        });
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                         // margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: backgroundColor? Colors.white:Colors.black,
                          ),
                          child: Image.asset(imgUrl)
                      ),
                    );
                  },
                );
              }).toList(),
            ),)
          ],
        ),

      ),

    );
  }


}
