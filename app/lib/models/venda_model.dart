import 'dart:ffi';

import 'package:gr/models/cliente_model.dart';
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
    late ClienteModel? cliente;
    late UsuarioModel? usuario;

    VendaModel({
        this.id,
        this.clienteId,
        this.usuarioId,
        required this.data,
        required this.totalQtd,
        required this.totalPagar,
        required this.totalPago,
        required this.troco,
        cliente, usuario
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

    Future<Future<int>> salvar() async {
        Database db = await DatabaseHelper.instance.database;
        return db.insert('venda', toMap());
    }
}
