import 'package:gr/models/modelo_global.dart';
import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';

class FornecedorModel extends ModeloGlobal {
    static String get tabela => 'fornecedor';
    late  int? id;
    late  String nome;
    late  String? endereco;
    late  String? telefone;
    late  String nif;
    //List<VendaModel> vendas = [];
    FornecedorModel(
        {this.id,
            required this.nome,
            required this.nif,
            this.endereco,
            this.telefone});

    Map<String, dynamic> toMap() {
        return {
            'id': id,
            'nome': nome,
            'telefone': telefone,
            'nif': nif,
            'endereco': endereco,
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
        await  db.execute("PRAGMA foreign_keys=ON");
        return await db.delete(tabela, where: 'id = ?', whereArgs: [id]);
    }

    static Future<FornecedorModel> findOneById(int id) async {
        Database db = await DatabaseHelper.instance.database;
        List<Map<String, dynamic>> maps = await db.query(
            tabela,
            where: 'id = ?',
            whereArgs: [id],
        );
        if (maps.isNotEmpty) {
            return FornecedorModel.fromMap(maps.first);
        }
        throw Exception("Não foi possivel encontrar este fornecedor");
    }

    static Future<List<FornecedorModel>> index() async {
        Database db = await DatabaseHelper.instance.database;
        List<Map<String, dynamic>> maps =
        await db.query('fornecedor', orderBy: 'id DESC');

        return List.generate(maps.length, (index) {
            return FornecedorModel.fromMap(maps[index]);
        });
    }

    static Future<List<FornecedorModel>> search(String search) async {
        Database db = await DatabaseHelper.instance.database;
        List<Map<String, dynamic>> maps = await db.query('fornecedor',
            orderBy: 'id DESC',
            where: 'nome LIKE ? OR nif LIKE ?',
            whereArgs: ['%$search%', '%$search%']);
        return List.generate(maps.length, (index) {
            return FornecedorModel.fromMap(maps[index]);
        });
    }

    update() {}


}
