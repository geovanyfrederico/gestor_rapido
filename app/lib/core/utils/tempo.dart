import 'package:intl/intl.dart';

class Tempo {

  static String formatarData(String dataString) {
    DateFormat formatoEntrada = DateFormat("yyyy-MM-dd");
    DateFormat formatoSaida = DateFormat("dd/MM/yyyy");
    DateTime data = formatoEntrada.parse(dataString);
    return formatoSaida.format(data);
  }

}
