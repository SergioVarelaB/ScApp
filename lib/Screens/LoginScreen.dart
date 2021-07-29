import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sc_app/API/services/UserServices.dart';
import 'package:sc_app/Utils/AppSharedPreferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailField = TextEditingController();
  final passwordField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          top: 40,
          right: 10,
          bottom: 20,
        ),
        child: Column(
          children: [
            TextField(
              controller: emailField,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Correo',
              ),
            ),
            TextField(
              controller: passwordField,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Contraseña',
              ),
            ),
            ElevatedButton(onPressed: login, child: Text("Iniciar sesion"))
          ],
        ),
      ),
    );
  }

  void login() async {
    FocusScope.of(context).unfocus();
    final response = await UserServices.login(emailField.text, passwordField.text);
    if(response.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.message))
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Bienvenido"))
      );
      await AppSharedPreferences.setToken(response.data!.token!);
      Navigator.pushNamed(context, "/main");
    }
  }
}
