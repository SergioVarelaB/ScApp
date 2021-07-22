import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(MyApp());
}
/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Team(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: HexColor('#000000'),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Equipos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: HexColor('#BB86FC'),
        unselectedItemColor: HexColor('#FFFFFF'),
        onTap: _onItemTapped,
      ),
    );
  }
}


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


class Team extends StatelessWidget {
  const Team({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#494646'),
    );
  }
}


class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

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