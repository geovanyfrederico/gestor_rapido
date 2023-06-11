class Testos{
  static String primeiraLetraNomeSobrenome(String? nomeCompleto) {
    return "GR";
  }
  static String siglas(String nomeCompleto) {
    List<String> nomes = nomeCompleto.trim().split(" ");
    String p0 = nomes[0].substring(0, 1);
    String p1 = nomes.last.substring(0, 1);
    return p0 + p1;
  }
}
