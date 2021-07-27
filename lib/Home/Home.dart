import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        padding: new EdgeInsets.only(top: 36.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'Hola, Pablito!!',
              style: new TextStyle(
                  fontSize: 36.0,
                  fontFamily: 'Roboto Bold',
                  color: HexColor('#FFFFFF')
              ),
            )
          ],
        ),
      ),
      backgroundColor: HexColor('#494646'),
    );
  }
}
