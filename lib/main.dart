import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sc_app/Screens/Home/MainApp.dart';
import 'package:sc_app/Screens/LoginScreen.dart';
import 'package:sc_app/changeNotifiers/UserChangeNotifier.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UserChangeNotifier())
        ],
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{
        '/': (context) => LoginPage(),
        '/main': (context) => MainApp()
      },
      initialRoute: '/',
    );
  }
}