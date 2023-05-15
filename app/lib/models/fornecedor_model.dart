import 'package:gr/models/modelo_global.dart';
import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';

class FornecedorModel extends ModeloGlobal{

    static String get tabela => 'fornecedor';
    late final int? id;
    late final String nome;
    late final String? endereco;
    late final String? telefone;
    late final String nif;
    //List<VendaModel> vendas = [];
    FornecedorModel({
        this.id,
        required this.nome,
        required this.nif,
        this.endereco,
        this.telefone

    });

    Map<String, dynamic> toMap() {
        return {
            'id': id,
            'nome': nome,
            'telefone': telefone,
            'nif': nif,
            'endereco': endereco ,
        };
    }

    factory FornecedorModel.fromMap(Map<String, dynamic> map) {
        return FornecedorModel(
            id: map['id'],
            nome: map['nome'],
            endereco: map['endereco'],
            nif: map['nif'],
            telefone: map['telefone'],
        );
    }
    Future<int> salvar() async {
        Database db = await DatabaseHelper.instance.database;
        return db.insert('fornecedor', toMap());
    }
// exclui um registro do banco de dados
    static Future<int> eliminar(int? id) async {
        Database db = await DatabaseHelper.instance.database;
        return await db.delete(tabela, where: 'id = ?', whereArgs: [id]);
    }
}


