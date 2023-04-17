import 'package:gr/src/models/empresa_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:gr/src/models/database_helper.dart';

class EmpresaService{
  Future<List<EmpresaModel>> tudo() async {
    Database db = await DatabaseHelper.instance.database;
    final List<Map<String, Object?>> queryResult =
    await db.query('empresa');
    return queryResult.map((e) => EmpresaModel.fromMap(e)).toList();
  }
}
