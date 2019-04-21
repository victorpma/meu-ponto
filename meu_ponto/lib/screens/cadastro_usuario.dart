import 'package:flutter/material.dart';

class CadastroUsuarioPage extends StatefulWidget {
  @override
  _CadastroUsuarioPageState createState() => _CadastroUsuarioPageState();
}

class _CadastroUsuarioPageState extends State<CadastroUsuarioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          title: new Text(""),
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.grey),
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TituloCadastro(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TextFormField(
                          autofocus: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: "Nome"),
                          style:
                              new TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: TextFormField(
                            autofocus: true,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(labelText: "Email"),
                            style:
                                new TextStyle(color: Colors.blue, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: TextFormField(
                            autofocus: true,
                            obscureText: true,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(labelText: "Senha"),
                            style:
                                new TextStyle(color: Colors.blue, fontSize: 16),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Material(
                                color: Colors.blue,
                                elevation: 5,
                                borderRadius: BorderRadius.circular(30),
                                child: MaterialButton(
                                  height: 50,
                                  child: Text(
                                    "Cadastrar",
                                    style: new TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  onPressed: () => null,
                                )))
                      ]),
                ),
              ],
            ),
          ),
        )));
  }
}

class TituloCadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Text(
          "Crie sua conta grátis",
          textAlign: TextAlign.center,
          style: new TextStyle(
              color: Colors.grey.shade600,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: "Roboto"),
        ));
  }
}
