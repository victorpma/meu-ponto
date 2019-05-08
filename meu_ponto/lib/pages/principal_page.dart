import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meu_ponto/models/usuario_model.dart';
import 'package:meu_ponto/models/ponto_model.dart';
import 'package:meu_ponto/dialogs/bater_ponto.dart';
import 'package:meu_ponto/utils/database_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meu_ponto/pages/listar_ponto_dia_page.dart';
import 'package:meu_ponto/utils/formatacao.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, @required this.usuario}) : super(key: key);
  final Usuario usuario;

  @override
  _HomePageState createState() => _HomePageState();
}

Formatacao formatacao;

class _HomePageState extends State<HomePage> {
  DatabaseHelper databaseHelper = new DatabaseHelper();
  String _dataAtual;
  String _horaAtual;
  TimeOfDay _hora;

  @override
  void initState() {
    _obterDataAtual();
    _obterHoraAtual();

    Timer.periodic(Duration(seconds: 1), (Timer t) => _obterHoraAtual());
    super.initState();
  }

  _obterDataAtual() {
    setState(() {
      this._dataAtual = formatacao.obterDataFormatadaBrasil(DateTime.now());
    });
  }

  _obterHoraAtual() {
    setState(() {
      this._horaAtual =
          "${DateTime.now().hour}:${DateTime.now().minute}:${_formatarSegundo()}";
    });
  }

  String _formatarSegundo() {
    return DateTime.now().second < 10
        ? "0" + DateTime.now().second.toString()
        : DateTime.now().second.toString();
  }

  Future<Null> _baterPonto(BuildContext context, String tpPonto) async {
    TimeOfDay _horaAtual = new TimeOfDay.now();
    final TimeOfDay _horaSelecionada = await showTimePicker(
      context: context,
      initialTime: _horaAtual,
    );

    if (_horaSelecionada != null) {
      _hora = _horaSelecionada;

      var db = new DatabaseHelper();

      Ponto novoPonto = new Ponto(tpPonto, DateTime.now().toString(),
          "${_hora.hour.toString()}:${_hora.minute.toString()}");

      int pontoCadastrado = await db.inserirPonto(novoPonto);

      if (pontoCadastrado > 0) {
        Fluttertoast.showToast(
            msg: "Ponto cadastrado com sucesso!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: new Text("Bater Ponto"),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Fulano"),
              accountEmail: new Text("${widget.usuario.email}"),
            ),
            new ListTile(
              trailing: new Icon(Icons.access_alarm),
              title: new Text("Bater Ponto"),
            ),
            new ListTile(
                trailing: new Icon(Icons.calendar_view_day),
                title: new Text("Por Dia"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListarPontoDia()));
                }),
            new ListTile(
              trailing: new Icon(Icons.history),
              title: new Text("Histórico de Pontos"),
            ),
            new ListTile(
              trailing: new Icon(Icons.save),
              title: new Text("Extrato"),
            ),
            new Divider(),
            new ListTile(
              trailing: new Icon(Icons.settings),
              title: new Text("Configurações"),
            ),
            new ListTile(
              trailing: new Icon(Icons.exit_to_app),
              title: new Text("Sair"),
            )
          ],
        ),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _dataAtual,
                  style: new TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  _horaAtual,
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                          child: Row(
                        children: <Widget>[
                          Text(
                            "08:00",
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          Icon(
                            Icons.transit_enterexit,
                            color: Colors.green,
                          )
                        ],
                      )),
                      Container(
                          child: Row(
                        children: <Widget>[
                          Text(
                            "12:00",
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          Transform.rotate(
                            angle: 60,
                            child: Icon(
                              Icons.transit_enterexit,
                              color: Colors.red,
                            ),
                          )
                        ],
                      )),
                      Container(
                          child: Row(
                        children: <Widget>[
                          Text(
                            "13:00",
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          Icon(
                            Icons.transit_enterexit,
                            color: Colors.green,
                          )
                        ],
                      )),
                      Container(
                          child: Row(
                        children: <Widget>[
                          Text(
                            "17:00",
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          Transform.rotate(
                            angle: 60,
                            child: Icon(
                              Icons.transit_enterexit,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                ))
              ]),
          Expanded(
            child: Align(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        child: Material(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.circular(30),
                          elevation: 5,
                          child: MaterialButton(
                            height: 60,
                            onPressed: () => _baterPonto(context, "E"),
                            child: Text(
                              "ENTRADA",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        child: Material(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30),
                          elevation: 5,
                          child: MaterialButton(
                            height: 60,
                            onPressed: () => _baterPonto(context, "S"),
                            child: Text(
                              "SAÍDA",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
          Container(
              color: Colors.blue,
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "Trabalhado no Dia: ",
                          style:
                              new TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          "00:00",
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Trabalhado no Dia: ",
                          style:
                              new TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          "00:00",
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Saldo Total: ",
                          style:
                              new TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          "00:00",
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
