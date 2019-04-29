class Formatacao {
  Formatacao();

  String _obterDescricaoDia(int dia) {
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
}
