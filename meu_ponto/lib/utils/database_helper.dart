import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:meu_ponto/models/ponto_model.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;
  final String tabelaPonto = "PONTO";
  final String colunaCodigoPonto = "CD_PONTO";
  final String colunaDataPonto = "DT_PONTO";
  final String colunaTipoPonto = "TP_PONTO";
  final String colunaHoraPonto = "HR_PONTO";

  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper.internal();

  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;

    _db = await inicializarBD();

    return _db;
  }

  Future<Database> inicializarBD() async {
    Directory documentoDiretorio = await getApplicationDocumentsDirectory();

    String caminho = join(documentoDiretorio.path, "meu_ponto.db");

    var meuPontoBD =
        await openDatabase(caminho, version: 1, onCreate: _onCreate);

    return meuPontoBD;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tabelaPonto($colunaCodigoPonto INTEGER PRIMARY KEY,"
        "$colunaTipoPonto TEXT,"
        "$colunaDataPonto TEXT,"
        "$colunaHoraPonto TEXT)");
  }

  Future<int> inserirPonto(Ponto ponto) async {
    var bd = await this.db;

    int resultado = await bd.insert("$tabelaPonto", ponto.toMap());

    return resultado;
  }

  Future<List<Ponto>> obterPontosPorData(DateTime data) async {
    List<Ponto> pontos = new List<Ponto>();

    var bd = await this.db;

    var resultado =
        await bd.query("$tabelaPonto");

    if (!resultado.isEmpty) {
      for (int i = 0; i <= resultado.length-1; i++) {
        pontos.add(Ponto.map(resultado[i]));
      }
    }

    return pontos;
  }

  Future fechar() async {
    var bd = await this.db;

    bd.close();
  }
}