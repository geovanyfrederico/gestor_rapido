import 'dart:developer';

import 'package:gr/models/modelo_global.dart';
import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';

class UtilizadorModel extends ModeloGlobal{
    static String get tabela => 'utilizador';
    static const int tipoVendedor = 0;
    static const int tipoGerente = 1;
    static const int tipoAdministrador = 2;
    static const int superUtilizador = 100;
    int? id;
    int tipo;
    String nome;
    String telefone;
    String pin;
    bool? ativo;
    UtilizadorModel({
        this.id,
        required this.nome,
        required this.telefone,
        required this.pin,
        this.ativo,
        required this.tipo
    });

    Map<String, dynamic> toMap() {
        return {
            'id': id,
            'nome': nome,
            'telefone': telefone,
            'tipo': tipo,
            'pin': pin,
            'ativo': ativo ,
        };
    }
    factory UtilizadorModel.fromMap(Map<String, dynamic> map) {

        return UtilizadorModel(
            id:map['id'],
            nome: map['nome'],
            telefone: map['telefone'],
            tipo: map['tipo'],
            pin: map['pin'],
            ativo: map['ativo'],
        );
    }
    Future<int> salvar() async {
        Database db = await DatabaseHelper.instance.database;
        return db.insert(tabela, toMap());
    }
    // insere um registro no banco de dados
    static Future<int> inserir(Map<String, dynamic> row) async {
        Database db = await DatabaseHelper.instance.database;
        return await db.insert(tabela, row);

    }

// atualiza um registro no banco de dados
    static Future<int> atualizar(Map<String, dynamic> row) async {
        Database db = await DatabaseHelper.instance.database;
        int id = row['id'];
        return await db.update(tabela, row, where: 'id = ?', whereArgs: [id]);
    }

// exclui um registro do banco de dados
    static Future<int> eliminar(int id) async {
        Database db = await DatabaseHelper.instance.database;
        return await db.delete(tabela, where: 'id = ?', whereArgs: [id]);
    }

// retorna todos os registros do banco de dados
    static Future<List<Map<String, dynamic>>> tudo() async {
        Database db = await DatabaseHelper.instance.database;
        return await db.query(tabela);
    }
    String tipoDescricao(){
        if(tipo == tipoAdministrador){
            return 'Administrador';
        }
        if(tipo == tipoVendedor){
            return 'Vendedor';
        }
        if(tipo == tipoGerente){
            return 'Gerente';
        }
        return 'Não definido';
    }
    static String tipoDescricaoStatico(int? tipo){
        if(tipo == tipoAdministrador){
            return 'Administrador';
        }
        if(tipo == tipoVendedor){
            return 'Vendedor';
        }
        if(tipo == tipoGerente){
            return 'Gerente';
        }
        return 'Não definido';
    }

    static findOneById(int id) async {
        Database db = await DatabaseHelper.instance.database;
        List<Map<String, dynamic>> maps = await db.query(
            tabela,
            where: 'id = ?',
            whereArgs: [id],
        );
        if (maps.isNotEmpty) {
            return UtilizadorModel.fromMap(maps.first);
        }
        throw Exception("Não foi possivel encontrar este cliente");
    }

    static Future<List<UtilizadorModel>> search(String search) async {
        Database db = await DatabaseHelper.instance.database;
        List<Map<String, dynamic>> maps = await db.query('utilizador',
            orderBy: 'id DESC',
            where: 'nome LIKE ? OR telefone LIKE ?',
            whereArgs: ['%$search%', '%$search%']);
        return List.generate(maps.length, (index) {
            return UtilizadorModel.fromMap(maps[index]);
        });
    }

    static Future<List<UtilizadorModel>> index() async {
        Database db = await DatabaseHelper.instance.database;
        List<Map<String, dynamic>> maps =
        await db.query('utilizador', orderBy: 'id DESC');
        return List.generate(maps.length, (index) {
            log(maps[index].toString());
            return UtilizadorModel.fromMap(maps[index]);
        });
    }


}
