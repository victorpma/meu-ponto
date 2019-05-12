class Ponto {
  int _cdPonto;
  String _tpPonto;
  String _dtPonto;
  String _hrPonto;

  Ponto(this._tpPonto, this._dtPonto, this._hrPonto);

  int get cdPonto => _cdPonto;
  String get dtPonto => _dtPonto;
  String get tpPonto => _tpPonto;
  String get hrPonto => _hrPonto;

  Ponto.map(dynamic objeto) {
    this._cdPonto = objeto["CD_PONTO"];
    this._tpPonto = objeto["TP_PONTO"];
    this._dtPonto = objeto["DT_PONTO"].toString();
    this._hrPonto = objeto["HR_PONTO"].toString();
  }

  Map<String, dynamic> toMap() {
    var mapPonto = new Map<String, dynamic>();
    mapPonto["CD_PONTO"] = _cdPonto;
    mapPonto["TP_PONTO"] = _tpPonto;
    mapPonto["DT_PONTO"] = _dtPonto.toString();
    mapPonto["HR_PONTO"] = _hrPonto.toString();

    return mapPonto;
  }
}
