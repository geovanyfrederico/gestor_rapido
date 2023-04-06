class UtilizadorModel {
  static const String tipoVendedor = "v";
  static const String tipoAdministrador = "a";
  static const String tipoGerente = "g";
  int id;
  String nome;
  int pin;
  String tipo;

  UtilizadorModel({
    this.id = 0,
    required this.nome,
    required this.pin,
    this.tipo = tipoVendedor,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'pin': pin,
      'tipo': tipo ,
    };
  }

  factory UtilizadorModel.fromMap(Map<String, dynamic> map) {
    return UtilizadorModel(
      id: map['id'],
      nome: map['nome'],
      pin: map['pin'],
      tipo: map['tipo'],
    );
  }
}
