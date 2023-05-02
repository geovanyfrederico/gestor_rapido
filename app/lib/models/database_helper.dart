import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = 'gr.db';
  static const _databaseVersion =3;
  static final DatabaseHelper instance = DatabaseHelper._init();
  // tem apenas uma referência ao banco de dados
  static Database? _database;
  DatabaseHelper._init();
  Future<Database> get database async {
    if (_database != null ) return _database!;
    // instancia o banco de dados na primeira vez que ele for acessado
    _database = await _initDatabase();
    return _database!;
  }
  // abre o banco de dados
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }
  // cria a tabela no banco de dados
  Future _onCreate(Database db, int version) async {
 log("criando");
    // Criar empresa
    await db.execute('''
    CREATE TABLE empresa(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        endereco TEXT,
        telefone TEXT,
        nif TEXT NOT NULL,
        logo TEXT
      );
    ''');
    // criar usuario
    await db.execute('''
          CREATE TABLE usuario (
   id INTEGER PRIMARY KEY AUTOINCREMENT ,
   telefone TEXT  DEFAULT NULL,
   nome TEXT  DEFAULT NULL,
   tipo INTEGER  DEFAULT NULL,
   pin TEXT DEFAULT NULL,
   ativo INTEGER DEFAULT NULL
    );
    ''');
    //Criar clientes
    await db.execute('''
         CREATE TABLE clientes (
      id INTEGER PRIMARY KEY AUTOINCREMENT ,
    nome TEXT  DEFAULT NULL,
    nif TEXT  DEFAULT NULL,
    endereco TEXT  DEFAULT NULL,
    telefone TEXT  DEFAULT NULL
    );
    ''');

    await db.execute('''
         CREATE TABLE produto (
      id INTEGER PRIMARY KEY AUTOINCREMENT ,
      nome TEXT DEFAULT NULL,
      codigo TEXT UNIQUE  DEFAULT NULL,
      preco REAL  DEFAULT NULL,
      stock INTEGER  DEFAULT NULL,
      foto TEXT DEFAULT NULL
    );
    ''');

  }

  // insere um registro no banco de dados
  Future<int> insert(String table, Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  // atualiza um registro no banco de dados
  Future<int> update(String table, Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row['id'];
    return await db.update(table, row, where: 'id = ?', whereArgs: [id]);
  }

  // exclui um registro do banco de dados
  Future<int> delete(String table, int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  // retorna todos os registros do banco de dados
  Future<List<Map<String, dynamic>>> queryAllRows(String table) async {
    Database db = await instance.database;
    return await db.query(table);
  }

  // retorna um registro pelo id
  Future<Map<String, dynamic>> queryById(table, int id) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> result =
    await db.query(table, where: 'id = ?', whereArgs: [id], limit: 1);
    return result.first;
  }
  Future close()  async {
    final db = await instance.database;
    db.close();
  }
}
