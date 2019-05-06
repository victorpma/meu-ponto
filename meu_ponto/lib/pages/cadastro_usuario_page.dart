import 'package:flutter/material.dart';
import 'package:meu_ponto/models/usuario_model.dart';

class CadastroUsuarioPage extends StatefulWidget {
  @override
  _CadastroUsuarioPageState createState() => _CadastroUsuarioPageState();
}

class _CadastroUsuarioPageState extends State<CadastroUsuarioPage> {
  TextEditingController _nomeController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _senhaController = new TextEditingController();
  bool _nomeError = false;
  bool _emailError = false;
  bool _senhaError = false;
  String _mensagemErrorNome = "";
  String _mensagemErrorEmail = "";
  String _mensagemErrorSenha = "";

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
                          decoration: InputDecoration(
                              labelText: "Nome",
                              errorText:
                                  _nomeError ? _mensagemErrorNome : null),
                          style:
                              new TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: TextFormField(
                            autofocus: true,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                labelText: "Email",
                                errorText:
                                    _emailError ? _mensagemErrorEmail : null),
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
                            decoration: InputDecoration(
                                labelText: "Senha",
                                errorText:
                                    _senhaError ? _mensagemErrorSenha : null),
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
                                  onPressed: () => realizarCadastro(),
                                )))
                      ]),
                ),
              ],
            ),
          ),
        )));
  }

  void realizarCadastro() {
    var nome = _nomeController.text;
    var email = _emailController.text;
    var senha = _senhaController.text;

    Usuario usuario = new Usuario(email);

    if (usuario.nome.isEmpty) {
      _mensagemErrorNome = "Campo Obrigatório!";
      _nomeError = true;
    } else {
      _nomeError = false;
    }

    if (usuario.email.isEmpty) {
      _mensagemErrorEmail = "Campo Obrigatório!";
      _emailError = true;
    } else {
      _emailError = false;
    }

    if (usuario.senha.isEmpty) {
      _mensagemErrorSenha = "Campo Obrigatório!";
      _senhaError = true;
    } else {
      if (usuario.senha.length < 6) {
        _mensagemErrorSenha = "Senha deve possuir no mínimo 6 caracteres!";
        _senhaError = true;
      }
      _senhaError = false;
    }
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
