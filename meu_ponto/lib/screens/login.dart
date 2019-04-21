import 'package:flutter/material.dart';
import 'package:meu_ponto/screens/principal.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _senhaController = new TextEditingController();
  bool _emailError = false;
  bool _senhaError = false;
  String _mensagemErrorEmail = "";
  String _mensagemErrorSenha = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            HeaderLogin(),
            Center(
                child: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      controller: _emailController,
                      autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: new TextStyle(color: Colors.blue),
                          errorText: _emailError ? _mensagemErrorEmail : null),
                      style: new TextStyle(color: Colors.black, fontSize: 16),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Campo Obrigatório";
                        }
                      },
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: TextFormField(
                          controller: _senhaController,
                          autofocus: true,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Senha",
                              labelStyle: new TextStyle(color: Colors.blue),
                              errorText:
                                  _senhaError ? _mensagemErrorSenha : null),
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        )),
                    TextEsqueceuSenha(),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Material(
                          borderRadius: BorderRadius.circular(30.0),
                          shadowColor: Colors.lightBlueAccent.shade100,
                          elevation: 5.0,
                          child: MaterialButton(
                            minWidth: 200,
                            height: 50,
                            onPressed: () => RealizarLogin(),
                            color: Colors.blue,
                            child: Text(
                              "Entrar",
                              style: new TextStyle(color: Colors.white),
                            ),
                          ),
                        )),
                    TextCadastreSe()
                  ],
                ),
              ),
            ))
          ]),
        ));
  }

  void RealizarLogin() {
    setState(() {
      String email = _emailController.text;
      String senha = _senhaController.text;

      if (email.isEmpty) {
        _mensagemErrorEmail = "Campo Obrigatório!";
        _emailError = true;
      } else
        _emailError = false;

      if (senha.isEmpty) {
        _mensagemErrorSenha = "Campo Obrigatório!";
        _senhaError = true;
      } else
        _senhaError = false;

      if (!_emailError && !_senhaError) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PrincipalPage()));
      }
    });
  }
}

class HeaderLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.5,
        decoration: BoxDecoration(color: Colors.blue),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.access_time,
                size: 100,
                color: Colors.white,
              ),
              Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    "Bem - Vindo ao Meu Ponto!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: Text(
                  "Pronto para deixar sua carga horária de trabalho em dias?",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              )
            ],
          ),
        ));
  }
}

/*
class InputEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      autofocus: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: "Email", labelStyle: new TextStyle(color: Colors.blue)),
      style: new TextStyle(color: Colors.black, fontSize: 16),
      validator: (value) {
        if (value.isEmpty) {
          return "Campo Obrigatório";
        }
      },
    );
    return textFormField;
  }
}*/

class InputSenha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: TextFormField(
          autofocus: true,
          obscureText: true,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              labelText: "Senha",
              labelStyle: new TextStyle(color: Colors.blue)),
          style: TextStyle(color: Colors.black, fontSize: 16),
        ));
  }
}

class TextEsqueceuSenha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 20),
        child: Text(
          "Esqueceu sua senha?",
          textAlign: TextAlign.end,
          style: TextStyle(color: Colors.grey, fontSize: 15),
        ));
  }
}

class ButtonEntrar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Material(
          borderRadius: BorderRadius.circular(30.0),
          shadowColor: Colors.lightBlueAccent.shade100,
          elevation: 5.0,
          child: MaterialButton(
            minWidth: 200,
            height: 50,
            onPressed: () => null,
            color: Colors.blue,
            child: Text(
              "Entrar",
              style: new TextStyle(color: Colors.white),
            ),
          ),
        ));
  }
}

class TextCadastreSe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 20),
        child: Center(
          child: Row(
            children: <Widget>[
              Text(
                "Ainda não possui uma conta?",
                style: new TextStyle(color: Colors.grey, fontSize: 15),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                child: Text(
                  "Cadastre-se!",
                  style: new TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ));
  }
}
