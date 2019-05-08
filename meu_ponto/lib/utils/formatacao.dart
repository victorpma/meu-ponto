class Formatacao {
  Formatacao();

  String obterDescricaoDia(int dia) {
    switch (dia) {
      case DateTime.sunday:
        return "Domingo";
        break;
      case DateTime.monday:
        return "Segunda";
        break;
      case DateTime.tuesday:
        return "Terça";
        break;
      case DateTime.wednesday:
        return "Quarta";
        break;
      case DateTime.thursday:
        return "Terça";
        break;
      case DateTime.friday:
        return "Terça";
        break;
      case DateTime.saturday:
        return "Sábado";
        break;
      default:
        return "Erro";
    }
  }

  String obterDataFormatadaBrasil(DateTime data) {
    String dataFormatada = "";

    if (data != null) {
      String dia = data.day.toInt() < 10
          ? "0${data.day.toString()}"
          : data.day.toString();

      String mes = data.month.toInt() < 10
          ? "0${data.month.toString()}"
          : data.month.toString();

      String ano = data.year.toString();

      dataFormatada = "${dia}/${mes}/${ano}";
    }

    return dataFormatada;
  }
}