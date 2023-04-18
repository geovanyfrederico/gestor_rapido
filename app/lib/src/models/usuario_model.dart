import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';

class UsuarioModel {

    static const String tabela = "usuario";
    static const int tipoVendedor = 0;
    static const int tipoAdministrador = 2;
    static const int tipoGerente = 1;
    int? id;
    int tipo;
    String nome;
    String telefone;
    String pin;
    bool ativo;
    UsuarioModel({
        this.id,
        required this.nome,
        required this.telefone,
        required this.pin,
        this.ativo = true,
        this.tipo = tipoAdministrador
    });

    Map<String, dynamic> toMap() {
        return {
            'id': id,
            'nome': nome,
            'telefone': telefone,
            'tipo': tipo,
            'pin': pin,
            'ativo': ativo ? 1:0,
        };
    }
    factory UsuarioModel.fromMap(Map<String, dynamic> map) {
        return UsuarioModel(
            id:map['id'],
            nome: map['nome'],
            telefone: map['telefone'],
            tipo: map['tipo'],
            pin: map['pin'],
            ativo: map['ativo'] == 1 ? true:false,
        );
    }
    Future<int> salvar() async {
        Database db = await DatabaseHelper.instance.database;
        return db.insert(tabela, toMap());
    }
}
