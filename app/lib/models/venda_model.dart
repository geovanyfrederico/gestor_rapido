import 'dart:developer';
import 'dart:ffi';

import 'package:gr/models/cliente_model.dart';
import 'package:gr/models/produto_na_venda_model.dart';
import 'package:gr/models/usuario_model.dart';
import 'package:sqflite/sqflite.dart';

import 'cliente_model.dart';
import 'database_helper.dart';

class VendaModel {
    int? id;
    int? clienteId;
    int? usuarioId;
    String data;
    int totalQtd;
    double totalPagar;
    double totalPago;
    double troco;

    Future<List<ProdutoNaVendaModel>> get produtos async {
        return await ProdutoNaVendaModel.findAllByVendaId(id!);
    }
    Future<ClienteModel> get cliente async {
        return await ClienteModel.findOneById(clienteId!);
    }
    Future<UsuarioModel> get usuario async {
        return await UsuarioModel.findOneById(usuarioId!);
    }
    VendaModel({
        this.id,
        this.clienteId,
        this.usuarioId,
        required this.data,
        required this.totalQtd,
        required this.totalPagar,
        required this.totalPago,
        required this.troco,
    });

    Map<String, dynamic> toMap() {
        return {
            'id':id,
            'clienteId':clienteId,
            'usuarioId':usuarioId,
            'data':data,
            'totalQtd':totalQtd,
            'totalPagar':totalPagar,
            'totalPago':totalPago,
            'troco':troco,
        };
    }

    factory VendaModel.fromMap(Map<String, dynamic> map) {
        return VendaModel(
            id: map['id'],
            clienteId: map['clienteId'],
            usuarioId: map['usuarioId'] ,
            data: map['data'],
            totalQtd: map['totalQtd'],
            totalPagar: map['totalPagar'],
            totalPago: map['totalPago'] ,
            troco: map['troco'],
        );
    }

    Future<int> salvar() async {
        Database db = await DatabaseHelper.instance.database;
        return db.insert('venda', toMap());
    }
    static  Future<List<VendaModel>> vendasDiarias() async {
        final Database database = await  DatabaseHelper.instance.database;

        final DateTime now = DateTime.now();
        final DateTime startOfDay = DateTime(now.year, now.month, now.day);
        final DateTime endOfDay = startOfDay.add(const Duration(days: 1));
        final List<Map<String, dynamic>> maps = await database.rawQuery('''
    SELECT * FROM venda
    WHERE data BETWEEN ? AND ?
  ''', [startOfDay.toIso8601String(), endOfDay.toIso8601String()]);

        return List.generate(maps.length, (index) {
            return VendaModel.fromMap(maps[index]);
        });

    }

    static  Future<List<VendaModel>> vendasSemanais() async {

        final Database database = await  DatabaseHelper.instance.database;

        final DateTime now = DateTime.now();
        final DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
        final DateTime endOfWeek = startOfWeek.add(Duration(days: 7));

        final List<Map<String, dynamic>> maps = await database.rawQuery(''' SELECT * FROM venda WHERE data BETWEEN ? AND ? ''', [startOfWeek.toIso8601String(), endOfWeek.toIso8601String()]);

        return List.generate(maps.length, (index) {
            return VendaModel.fromMap(maps[index]);
        });
    }

    static Future<List<VendaModel>> vendasMensais() async {

        final Database database = await  DatabaseHelper.instance.database;
        final DateTime now = DateTime.now();
        final DateTime startOfMonth = DateTime(now.year, now.month, 1);
        final DateTime endOfMonth = DateTime(now.year, now.month + 1, 1).subtract(Duration(days: 1));
        final List<Map<String, dynamic>> maps = await database.rawQuery(''' SELECT * FROM venda WHERE data BETWEEN ? AND ? ''', [startOfMonth.toIso8601String(), endOfMonth.toIso8601String()]);

        return List.generate(maps.length, (index) {
            return VendaModel.fromMap(maps[index]);
        });

    }
}
