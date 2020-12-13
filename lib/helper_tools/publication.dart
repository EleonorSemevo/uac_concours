import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//void main() {
//  runApp(MyApp(
//    items: List<String>.generate(100, (i) => "Item $i"),
//  ));
//}

class Publication extends StatelessWidget {
  final List<String> items;

  Publication({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Publications';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Container(
                  height: 30.0,
                  width: double.infinity,
                  color: Colors.green,
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Le titre de la publication",style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                ),
                Container(
                  decoration: BoxDecoration(),
                  child: Image.asset('assets/img.jpg'),
                  height: 250.0,
                  width: 350.0,
                ),
                Row(
                  children: <Widget>[

                    Container(

                      child: Text("15/08/2020",style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                    ),
                    Flexible(fit: FlexFit.tight, child: SizedBox()),
                    Expanded(
                      child: Icon(
                        Icons.star_border,
                        textDirection: TextDirection.rtl,
                        color: Colors.green,

                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            style: BorderStyle.solid,
                            width: 2.0,
                            color: Colors.black,
                          )
                      ),
                      child: Text("15"),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),

                  child: Container(
                    width: double.infinity,
                    child: Text('le texte de la publication ici est un truc de nombreuse truc '
                        'le texte de la publication ici est un truc de nombreuse truc '
                        'le texte de la publication ici est un truc de nombreuse truc '
                        'le texte de la publication ici est un truc de nombreuse truc ',
                    ),
                  ),

                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    //border: Border.all()
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}