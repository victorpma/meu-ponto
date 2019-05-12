import 'package:flutter/material.dart';
import 'package:meu_ponto/models/usuario_model.dart';
import 'package:meu_ponto/pages/principal_page.dart';
import 'package:meu_ponto/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _verificarUsuarioLogado();
    super.initState();
  }

  _verificarUsuarioLogado() async {
    try {      
      SharedPreferences prefs = await SharedPreferences.getInstance();

      bool usuarioLogado = prefs.getBool("Logado");

      if (usuarioLogado != null && usuarioLogado == true) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(usuario: new Usuario("email"))));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    } catch (exception) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: <Widget>[
      Container(
        decoration: BoxDecoration(color: Colors.blue),
      ),
      Center(
        child: Icon(Icons.access_time, size: 130, color: Colors.white),
      )
    ]));
  }
}
