import 'dart:math';

class Matematica{
  static String gerarNumerosAleatorios(int quantidade) {
    var random = Random();
    var numerosAleatorios = <int>[];

    for (var i = 0; i < quantidade; i++) {
      numerosAleatorios.add(random.nextInt(10000000)); // gera um número aleatório entre 0 e 9999999 e adiciona na lista
    }

    return numerosAleatorios.map((numero) => numero.toString()).join('');

  }


}
