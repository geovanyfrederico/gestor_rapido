import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = 'gr.db';

  static const _databaseVersion = 2;

  static final DatabaseHelper instance = DatabaseHelper._init();

  // tem apenas uma referência ao banco de dados
  static Database? _database;
  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
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
    criarSeeders(db);
    log("DB::ONCREATE::END");
  }

  // Funções de ajuda

  String addId() {
    return "id INTEGER PRIMARY KEY AUTOINCREMENT";
  }

  String addColuna(String nomeDaColuna,
      {String tipoDeDados = 'TEXT',
        bool permitirNull = true,
        String propriedades = ""}) {
    return "$nomeDaColuna $tipoDeDados $propriedades ${permitirNull ? 'DEFAULT NULL' : 'NOT NULL'}";
  }

  Future<void> criarChaveEstrangeira(Database db, String nomeTabela, String nomeColuna, String tabelaReferenciada, String colunaReferenciada) async {
    await db.execute('''
    ALTER TABLE $nomeTabela
    ADD COLUMN $nomeColuna INTEGER DEFAULT 0 REFERENCES $tabelaReferenciada($colunaReferenciada) ON DELETE RESTRICT;
  ''');
  }
  Future<void> criarTabelas(Database db) async {
    log("DB::TABLES::START");
    db.execute("PRAGMA foreign_keys=ON");
    try {
      await db.execute('''
    CREATE TABLE empresa(
        ${addId()},
        ${addColuna('nome', permitirNull: false, propriedades: 'UNIQUE')},
        ${addColuna('nif', permitirNull: false, propriedades: 'UNIQUE')},
        ${addColuna('endereco')},
        ${addColuna('telefone')},
        ${addColuna('logo')}
      );
    ''');
      //USUARIO
      await db.execute('''
     CREATE TABLE utilizador (
        ${addId()},
        ${addColuna('telefone', permitirNull: false, propriedades: 'UNIQUE')},
        ${addColuna('nome', permitirNull: false, propriedades: 'UNIQUE')},
        ${addColuna('tipo', tipoDeDados: 'INTEGER', permitirNull: false)},
        ${addColuna('pin')},
        ${addColuna('ativo')}
    );
    ''');
      //COMPRAR
      //Fornecedor
      await db.execute('''
    CREATE TABLE fornecedor (
        ${addId()},
        ${addColuna('nome', permitirNull: false, propriedades: 'UNIQUE')},
        ${addColuna('nif', permitirNull: false, propriedades: 'UNIQUE')},
        ${addColuna('endereco')},
        ${addColuna('telefone')}
    );
    ''');
      //CLIENTES
      await db.execute('''
    CREATE TABLE cliente (
        ${addId()},
        ${addColuna('nome', permitirNull: false, propriedades: 'UNIQUE')},
        ${addColuna('nif', permitirNull: true)},
        ${addColuna('endereco')},
        ${addColuna('telefone')}
    );
    ''');
      //PRODUTO
      await db.execute('''
    CREATE TABLE produto (
        ${addId()},
        ${addColuna('nome')},
        ${addColuna('codigo', permitirNull: false, propriedades: 'UNIQUE')},
        ${addColuna('preco', tipoDeDados: 'REAL')},
        ${addColuna('stock', tipoDeDados: 'INTEGER')},
        ${addColuna('foto')}
    );
    ''');
      //Categoria
      await db.execute('''
    CREATE TABLE categoria (
        ${addId()},
        ${addColuna('nome', permitirNull: false, propriedades: 'UNIQUE')}
    );
    ''');
      // movimentoDeStock
      await db.rawQuery('''
    CREATE TABLE movimentoDeStock (
        ${addId()},
        ${addColuna('tipo', permitirNull: false)},
        ${addColuna('ref')},
        ${addColuna('data', permitirNull: false)},
        ${addColuna('totalQtd', permitirNull: false, tipoDeDados: 'INTEGER')}
    );
    ''');
      //Venda
      await db.execute('''
    CREATE TABLE venda (
        ${addId()},
        ${addColuna('data', permitirNull: false)},
        ${addColuna('totalQtd', permitirNull: false, tipoDeDados: 'INTEGER')},
        ${addColuna('totalPagar', permitirNull: false, tipoDeDados: 'REAL')},
        ${addColuna('totalPago', permitirNull: false, tipoDeDados: 'REAL')},
        ${addColuna('troco', permitirNull: false, tipoDeDados: 'REAL')}
    );
    ''');
      await db.execute('''
    CREATE TABLE produtoNaVenda (
        ${addId()},
        ${addColuna('nome', permitirNull: false)},
        ${addColuna('totalQtd', permitirNull: false, tipoDeDados: 'INTEGER')},
        ${addColuna('precoTotal', permitirNull: false, tipoDeDados: 'REAL')},
        ${addColuna('preco', permitirNull: false, tipoDeDados: 'REAL')}
    );
    ''');
      //Compra
      await db.execute('''
    CREATE TABLE compra (
        ${addId()},
        ${addColuna('nome')},
        ${addColuna('data', permitirNull: false)},
        ${addColuna('totalQtd', permitirNull: false, tipoDeDados: 'INTEGER')},
        ${addColuna('totalPagar', permitirNull: false, tipoDeDados: 'REAL')},
        ${addColuna('totalPago', permitirNull: false, tipoDeDados: 'REAL')},
        ${addColuna('troco', permitirNull: false, tipoDeDados: 'REAL')},
        ${addColuna('codigo', permitirNull: false, propriedades: 'UNIQUE')}
    );
    ''');
      await db.execute('''
    CREATE TABLE produtoNaCompra (
        ${addId()},
        ${addColuna('nome', permitirNull: false)},
        ${addColuna('totalQtd', permitirNull: false, tipoDeDados: 'INTEGER')},
        ${addColuna('precoTotal', permitirNull: false, tipoDeDados: 'REAL')},
        ${addColuna('preco', permitirNull: false, tipoDeDados: 'REAL')}
    );
    ''');
      await criarChaveEstrangeira(db, "movimentoDeStock", "produtoId", "produto", "id");
      await criarChaveEstrangeira(db, "movimentoDeStock", "utilizadorId", "utilizador", "id");

      await criarChaveEstrangeira(db, "compra", "fornecedorId", "fornecedor", "id");
      await criarChaveEstrangeira(db, "compra", "utilizadorId", "utilizador", "id");
      await criarChaveEstrangeira(db, "produtoNaCompra", "produtoId", "produto", "id");
      await criarChaveEstrangeira(db, "produtoNaCompra", "compraId", "compra", "id");

      await criarChaveEstrangeira(db, "produtoNaVenda", "produtoId", "produto", "id");
      await criarChaveEstrangeira(db, "produtoNaVenda", "vendaId", "venda", "id");
      await criarChaveEstrangeira(db, "venda", "utilizadorId", "utilizador", "id");
      await criarChaveEstrangeira(db, "venda", "clienteId", "cliente", "id");

      log("DB::TABLES::END");
    } catch (e) {
      log("DB::TABLES::ERROR -> $e");
    }
  }

  Future<void> criarRelacionamentos(Database db) async {

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

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<void> criarSeeders(Database db) async {
    // Clientes
    await db.execute('''
      INSERT INTO cliente(nome, endereco, telefone, nif)
      VALUES(?, ?, ?, ?)
      ''', ['Consumidor Final', 'Desconhecido', '', '99999999']);


  }
}
