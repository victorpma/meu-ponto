class Usuario {
  int _codigo;
  String _nome;
  String _email;
  String _senha;

  Usuario(this._email);

  Usuario._();

  int get codigo => _codigo;
  String get nome => _nome;
  String get email => _email;
  String get senha => _senha;

  Usuario.map(dynamic objeto) {
    this._codigo = objeto["codigo"];
    this._nome = objeto["nome"];
    this._email = objeto["email"];
    this._senha = objeto["senha"];
  }

  Map<String, dynamic> toMap() {
    var mapUsuario = new Map<String, dynamic>();
    mapUsuario["codigo"] = this._codigo;
    mapUsuario["nome"] = this._nome;
    mapUsuario["email"] = this._email;
    mapUsuario["senha"] = this._senha;

    return mapUsuario;
  }
}
