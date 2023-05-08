class Testos{
  static String primeiraLetraNomeSobrenome(String nomeCompleto) {
    List<String> nomes = nomeCompleto.trim().split(" ");
    String primeiraLetraNome = nomes[0].substring(0, 1);
    String primeiraLetraSobrenome = nomes.last.substring(0, 1);
    return primeiraLetraNome + primeiraLetraSobrenome;
  }
}