import 'package:gr/models/modelo_global.dart';
import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';

class UsuarioModel extends ModeloGlobal{
    static String get tabela => 'usuario';
    static const int tipoVendedor = 0;
    static const int tipoGerente = 1;
    static const int tipoAdministrador = 2;
    static const int superUsuario = 100;
    int? id;
    int tipo;
    String nome;
    String telefone;
    String pin;
    bool? ativo;
    UsuarioModel({
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
    factory UsuarioModel.fromMap(Map<String, dynamic> map) {

        return UsuarioModel(
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
}
