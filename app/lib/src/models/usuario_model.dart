class UsuarioModel {
    static const String tipoVendedor = "v";
    static const String tipoAdministrador = "a";
    static const String tipoGerente = "g";
    int id;
    int tipo;
    String nome;
    int pin;
    bool ativo;
    UsuarioModel({
        required this.id,
        required this.nome,
        required this.pin,
        required this.ativo,
        required this.tipo
    });

    Map<String, dynamic> toMap() {
        return {
            'id': id,
            'nome': nome,
            'tipo': tipo,
            'pin': pin,
            'ativo': ativo,
        };
    }
    factory UsuarioModel.fromMap(Map<String, dynamic> map) {
        return UsuarioModel(
            id:map['id'],
            nome: map['nome'],
            tipo: map['tipo'],
            pin: map['pin'],
            ativo: map['ativo'],
        );
    }
}
