import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: <Widget>[
              HeaderLogin(),
              Center(
                  child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InputEmail(),
                    InputSenha(),
                    TextEsqueceuSenha(),
                    ButtonEntrar(),
                    TextCadastreSe()
                  ],
                ),
              ))
            ],
          ),
        ));
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
              Text(
                "Bem-Vindo ao Meu Ponto!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
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

class InputEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: "Email", labelStyle: new TextStyle(color: Colors.blue)),
        style: new TextStyle(color: Colors.black, fontSize: 16));
  }
}

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
        padding: EdgeInsets.only(top: 5),
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
        padding: EdgeInsets.only(top: 15),
        child: ButtonTheme(
          height: 50,
          child: RaisedButton(
            color: Colors.blue,
            onPressed: () => {},
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
                padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                child: Text(
                  "Cadastre-se!",                  
                  style: new TextStyle(color: Colors.blue, fontSize: 16),
                ),
              )
            ],
          ),
        ));
  }
}
