import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//void main() {
//  runApp(MyApp(
//    items: List<String>.generate(100, (i) => "Item $i"),
//  ));
//}

class Actualite extends StatelessWidget {
  final List<String> items;

  Actualite({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Long List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  Flexible(
                    flex: 4,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/img.jpg'),
                      ),
                      title: Text('${items[index]}'),
                      trailing:  Icon(Icons.star_border),

                      isThreeLine: true,
                      subtitle: Text('sous titre ici'),



                    ),
                  ),

                  Flexible(
                    flex: 2,
                    fit: FlexFit.loose,
                    child: Opacity(
                      opacity: 0.7,
                      child: Container(
                        height: 40.0,
                        color: Colors.grey,
                        width: double.infinity,
                        child: Text('beaucoup de texte ici hein'),

                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}