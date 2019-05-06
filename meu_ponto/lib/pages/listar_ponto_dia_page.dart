import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meu_ponto/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:meu_ponto/models/ponto_model.dart';

class ListarPontoDia extends StatefulWidget {
  @override
  _ListarPontoDiaState createState() => _ListarPontoDiaState();
}

class _ListarPontoDiaState extends State<ListarPontoDia> {
  List<Ponto> _pontosPorDia;
  DatabaseHelper db = new DatabaseHelper();

  @override
  void initState() {
    atualizarListView();
    super.initState();
  }

  void atualizarListView() {
    final Future<Database> dbFuture = db.inicializarBD();
    dbFuture.then((database) {
      Future<List<Ponto>> pontosFuture = db.obterPontosPorData(DateTime.now());
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
      body: Container(
        child: ListView.builder(
            itemCount: _pontosPorDia != null ? _pontosPorDia.length : 0,
            itemBuilder: (_, int posicao) {
              return new Card(                
                child: new Text("${_pontosPorDia[posicao].hrPonto.toString()}"),
              );
            }),
      ),
    );
  }
}
