import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meu_ponto/utils/database_helper.dart';
import 'package:meu_ponto/utils/formatacao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:meu_ponto/models/ponto_model.dart';

DateTime _dataSelecionada;
String _textDisplayDataSelecionada;
Formatacao formatacao = new Formatacao();

class ListarPontoDia extends StatefulWidget {
  @override
  _ListarPontoDiaState createState() => _ListarPontoDiaState();
}

class _ListarPontoDiaState extends State<ListarPontoDia> {
  List<Ponto> _pontosPorDia;
  DatabaseHelper db = new DatabaseHelper();

  @override
  void initState() {
    _dataSelecionada = DateTime.now();

    atualizarListView(_dataSelecionada);
    super.initState();
  }

  void _atualizarDisplayData(DateTime novaData) {
    setState(() {
      _dataSelecionada = novaData;
    });

    atualizarListView(novaData);
  }

  void atualizarListView(DateTime dataSelecionada) {
    final Future<Database> dbFuture = db.inicializarBD();
    dbFuture.then((database) {
      Future<List<Ponto>> pontosFuture = db.obterPontosPorData(dataSelecionada);
      pontosFuture.then((pontosList) {
        setState(() {
          this._pontosPorDia = pontosList;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Por Dia"), backgroundColor: Colors.blue),
        body: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              height: 50,
              child: new Row(
                children: <Widget>[
                  MaterialButton(
                    child: Icon(Icons.keyboard_arrow_left,
                        color: Colors.black, size: 50),
                    onPressed: () {
                      _atualizarDisplayData(_dataSelecionada =
                          _dataSelecionada.add(new Duration(days: -1)));
                    },
                  ),
                  Expanded(
                      child: Text(
                    formatacao.obterDescricaoDia(_dataSelecionada.day.toInt()) +
                        ", " +
                        formatacao.obterDataFormatadaBrasil(_dataSelecionada),
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  )),
                  MaterialButton(
                      child: Icon(Icons.keyboard_arrow_right,
                          color: Colors.black, size: 50),
                      onPressed: () {
                        _atualizarDisplayData(_dataSelecionada =
                            _dataSelecionada.add(new Duration(days: 1)));
                      })
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _pontosPorDia != null ? _pontosPorDia.length : 0,
                  itemBuilder: (_, int posicao) {
                    return new Card(
                      child: new Container(
                        padding: EdgeInsets.all(15.0),
                        child: new Row(
                          children: <Widget>[
                            _pontosPorDia[posicao].tpPonto == "E"
                                ? Icon(Icons.transit_enterexit,
                                    color: Colors.green, size: 30)
                                : Icon(Icons.transit_enterexit,
                                    color: Colors.red, size: 30),
                            Text(
                              "${_pontosPorDia[posicao].hrPonto.toString()}",
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              color: Colors.blue,
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Text(
                        "Horas Trabalhadas:",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      new Text("Saldo do Dia:",
                          style: TextStyle(color: Colors.white, fontSize: 16))
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      new Text("Saldo Total:",
                          style: TextStyle(color: Colors.white, fontSize: 16))
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
