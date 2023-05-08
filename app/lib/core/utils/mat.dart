import 'dart:math';

class Mat {
  static String numeroParaDinheiro(dynamic value, [String code = 'AOA', int digits = 2]) {
    if (value == null) {
      return '0,00';
    }
    String stringValue = value.toString();
    List<String> parts = stringValue.split('.');
    parts[0] = parts[0].replaceAllMapped(
        RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => '${match.group(0)}.');
    if (parts.length == 2) {
      parts[1] = only2(parts[1]);
      return '${parts[0]},${parts[1]}';
    }
    return '${parts[0]},00';
  }

  static String only2(String value) {
    if (value.length >= 2) {
      return value.substring(0, 2);
    }
    if (value == null) {
      return '00';
    }
    if (value.length == 1) {
      return value + '0';
    }
    return value;
  }
  static String codigoAleatorio() {
    Random random = Random();
    int randomNumber = random.nextInt(9000) + 1000;
    return randomNumber.toString();
  }
}
