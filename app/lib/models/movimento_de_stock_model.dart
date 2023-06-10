import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';

class MovimentoDeStockModel {
    int? id;
    int produtoId;
    int utilizadorId;
    String data;
    int totalQtd;
    String ref;
    String tipo;


    MovimentoDeStockModel({
         this.id,
        required this.produtoId,
        required this.utilizadorId,
        required this.data,
        required this.totalQtd,
        required this.ref,
        required this.tipo,
    });

    Map<String, dynamic> toMap() {
        return {
            'id': id,
            'produtoId': produtoId,
            'utilizadorId': utilizadorId,
            'data': data,
            'totalQtd': totalQtd,
            'ref': ref,
            'tipo': tipo,
        };
    }

    factory MovimentoDeStockModel.fromMap(Map<String, dynamic> map) {
        return MovimentoDeStockModel(
            id: map['id'],
            produtoId: map['produtoId'],
            utilizadorId: map['utilizadorId'],
            data: map['data'],
            totalQtd: map['totalQtd'],
            ref: map['ref'],
            tipo: map['tipo'],
        );
    }
    // insere um registro no banco de dados
    Future<int> insert() async {
        Database db = await DatabaseHelper.instance.database;
        return await db.insert('movimentoDeStock', toMap());
    }

    // atualiza um registro no banco de dados
    Future<int> update() async {
        Database db = await DatabaseHelper.instance.database;
        return await db.update('movimentoDeStock', toMap(), where: 'id = ?', whereArgs: [id]);
    }

    // exclui um registro do banco de dados
    Future<int> delete() async {
        Database db = await DatabaseHelper.instance.database;
        return await db.delete('movimentoDeStock', where: 'id = ?', whereArgs: [id]);
    }

    // retorna todos os registros do banco de dados
    Future<List<Map<String, dynamic>>> queryAllRows() async {
        Database db = await DatabaseHelper.instance.database;
        return await db.query('movimentoDeStock');
    }

    // retorna um registro pelo id
    Future<Map<String, dynamic>> queryById() async {
        Database db = await DatabaseHelper.instance.database;
        List<Map<String, dynamic>> result =
        await db.query('movimentoDeStock', where: 'id = ?', whereArgs: [id], limit: 1);
        return result.first;
    }
}



