import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';

class EmpresaModel {
    final String tabela = 'empresa';
    final int? id;
    late final String nome;
    late final String endereco;
    late final String telefone;
    late final String nif;
    late final String logo;
    EmpresaModel({
        this.id,
        required this.nome,
        required this.nif ,
        this.endereco = "",
        this.telefone = "",
        this.logo = ""
    });

    Map<String, dynamic> toMap() {
        return {
            'id': id,
            'nome': nome,
            'telefone': telefone,
            'endereco': endereco ,
            'nif': nif ,
            'logo': logo ,
        };
    }

    factory EmpresaModel.fromMap(Map<String, dynamic> map) {
        return EmpresaModel(
            id: map['id'],
            nome: map['nome'],
            endereco: map['endereco'],
            telefone: map['telefone'],
            nif: map['nif'],
            logo: map['logo'],
        );
    }
    static Future<int> count() async {
        Database db = await DatabaseHelper.instance.database;
        List<Map<String, dynamic>> maps =
        await db.query('empresa', orderBy: 'id DESC');
        return maps.length;
    }
    static Future<List<EmpresaModel>> index() async {
        Database db = await DatabaseHelper.instance.database;
        List<Map<String, dynamic>> maps =
        await db.query('empresa', orderBy: 'id DESC');
        return List.generate(maps.length, (index) {
            return EmpresaModel(
                id: maps[index]['id'],
                nome: maps[index]['nome'],
                nif: maps[index]['nif'],
                endereco: maps[index]['endereco'],
                telefone: maps[index]['telefone'],
                logo: maps[index]['logo'],
            );
        });
    }
    Future<int> salvar() async {
        Database db = await DatabaseHelper.instance.database;
        return db.insert(tabela, {
            'nome': nome,
            'telefone': telefone,
            'endereco': endereco ,
            'nif': nif ,
            'logo': logo ,
        });
    }
}



