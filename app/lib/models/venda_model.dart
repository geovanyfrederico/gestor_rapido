
import 'dart:developer';

import 'package:gr/models/cliente_model.dart';
import 'package:gr/models/produto_na_venda_model.dart';
import 'package:gr/models/utilizador_model.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import 'cliente_model.dart';
import 'database_helper.dart';

class VendaModel {
    int? id;
    int? clienteId;
    int? utilizadorId;
    String data;
    int totalQtd;
    double totalPagar;
    double totalPago;
    double troco;
    ClienteModel? clienteModel;
    UtilizadorModel? utilizadorModel;

    Future<List<ProdutoNaVendaModel>> get produtos async {
        return await ProdutoNaVendaModel.findAllByVendaId(id!);
    }
    Future<ClienteModel> get cliente async {
        clienteModel ??= await ClienteModel.findOneById(clienteId!);
        return clienteModel!;
    }
    Future<UtilizadorModel> get utilizador async {
        utilizadorModel ??= await UtilizadorModel.findOneById(utilizadorId!);
        return utilizadorModel!;

    }
    VendaModel({
        this.id,
        this.clienteId,
        this.utilizadorId,
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
            'utilizadorId':utilizadorId,
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
            utilizadorId: map['utilizadorId'] ,
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
        final DateTime startOfWeek = DateTime(now.year, now.month, now.day - now.weekday + 1, 0, 0, 0);
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
