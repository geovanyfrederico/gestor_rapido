import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = 'gr.db';
  static const _databaseVersion =1;
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
    log("DB::ONCREATE::START");
    await criarTabelas(db);
    criarRelacionamentos(db);
    log("DB::ONCREATE::END");
  }


  // Funções de ajuda

  String addId(){
    return  "id INTEGER PRIMARY KEY AUTOINCREMENT";
  }

  String addColuna(String nomeDaColuna, {String tipoDeDados = 'TEXT', bool permitirNull = true, String propriedades = ""}){
    return  "$nomeDaColuna $tipoDeDados $propriedades ${permitirNull ? 'DEFAULT NULL': 'NOT NULL'}";
  }


  Future<void> criarTabelas(Database db) async {
    log("DB::TABLES::START");
    try{
      //EMPRESA
      await db.execute('''
    CREATE TABLE empresa(
        ${addId()},
        ${addColuna('nome', permitirNull:false, propriedades: 'UNIQUE')},
        ${addColuna('nif',  permitirNull:false, propriedades: 'UNIQUE')},
        ${addColuna('endereco')},
        ${addColuna('telefone')},
        ${addColuna('logo')}
      );
    ''');
      //USUARIO
      await db.execute('''
     CREATE TABLE usuario (
        ${addId()},
        ${addColuna('telefone', permitirNull:false, propriedades: 'UNIQUE')},
        ${addColuna('nome', permitirNull:false, propriedades: 'UNIQUE')},
        ${addColuna('tipo', tipoDeDados: 'INTEGER', permitirNull: false)},
        ${addColuna('pin')},
        ${addColuna('ativo')}
    );
    ''');
      //CLIENTES
      await db.execute('''
    CREATE TABLE clientes (
        ${addId()},
        ${addColuna('nome',  permitirNull:false, propriedades: 'UNIQUE' )},
        ${addColuna('nif',  permitirNull:false, propriedades: 'UNIQUE')},
        ${addColuna('endereco')},
        ${addColuna('telefone')}
    );
    ''');
      //PRODUTO
      await db.execute('''
    CREATE TABLE produto (
        ${addId()},
        ${addColuna('nome')},
        ${addColuna('codigo',  permitirNull:false, propriedades: 'UNIQUE')},
        ${addColuna('preco', tipoDeDados: 'REAL')},
        ${addColuna('stock', tipoDeDados: 'INTEGER')},
        ${addColuna('foto')}
    );
    ''');
      log("DB::TABLES::END");
    }catch(e){
      log("DB::TABLES::ERROR -> $e");
    }

  }

  void criarRelacionamentos(Database db){

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
