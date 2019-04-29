import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meu_ponto/pages/principal.dart';
import 'package:meu_ponto/pages/cadastro_usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meu_ponto/models/usuario.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email, _senha;

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
                      autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: new TextStyle(color: Colors.blue),
                      ),
                      style: new TextStyle(color: Colors.black, fontSize: 16),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Campo Obrigatório";
                        }
                      },
                      onSaved: (input) => _email = input,
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: TextFormField(
                          autofocus: true,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "Senha",
                            labelStyle: new TextStyle(color: Colors.blue),
                          ),
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          validator: (value) {
                            if (value.isEmpty) return "Campo Obrigatório";
                          },
                          onSaved: (input) => _senha = input,
                        )),
                    TextEsqueceuSenha(),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Material(
                          borderRadius: BorderRadius.circular(30.0),
                          elevation: 5,
                          color: Colors.blue,
                          child: MaterialButton(
                            height: 50,
                            onPressed: () => realizarLogin(),
                            child: Text(
                              "Entrar",
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 16),
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

  Future<void> realizarLogin() async {
    final formState = _formKey.currentState;

    if (formState.validate()) {
      formState.save();
      try {
        Usuario usuario = new Usuario();

        FirebaseUser usuarioFirebase = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _senha);

        if (usuarioFirebase != null) {          
          usuario.email = usuarioFirebase.email;
        }

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage(usuario: usuario)));
      } catch (exception) {
        print(exception.message);
      }
    }
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

class TextCadastreSe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 20),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Ainda não possui uma conta?",
                style: new TextStyle(color: Colors.grey, fontSize: 15),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                  child: new GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CadastroUsuarioPage()));
                    },
                    child: Text(
                      "Cadastre-se!",
                      style: new TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ))
            ],
          ),
        ));
  }
}
