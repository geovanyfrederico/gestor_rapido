import 'dart:ffi';

import 'package:gr/models/cliente_model.dart';
import 'package:gr/models/usuario_model.dart';

import 'cliente_model.dart';

class VendaModel {
    int id;
    int cliente_id;
    int usuario_id;
    String data;
    int totalQtd;
    double totalPagar;
    double totalPago;
    double troco;
    late ClienteModel cliente;
    late UsuarioModel usuario;

    VendaModel({
        required this.id,
        required this.cliente_id,
        required this.usuario_id,
        required this.data,
        required this.totalQtd,
        required this.totalPagar,
        required this.totalPago,
        required this.troco,
        required this.cliente,
        required this.usuario,
    });

    Map<String, dynamic> toMap() {
        return {
            'id':id,
            'cliente_id':cliente_id,
            'usuario_id':usuario_id,
            'data':data,
            'totalQtd':totalQtd,
            'totalPagar':totalPagar,
            'totalPago':totalPago,
            'troco':troco,
            'clientes':cliente,
            'usuario':usuario,
        };
    }

    factory VendaModel.fromMap(Map<String, dynamic> map) {
        return VendaModel(
            id: map['id'],
            cliente_id: map['cliente_id'],
            usuario_id: map['usuario_id'] ,
            data: map['data'],
            totalQtd: map['totalQtd'],
            totalPagar: map['totalPagar'],
            totalPago: map['totalPago'] ,
            troco: map['troco'],
            cliente: map['clientes'],
            usuario: map['usuario'],
        );
    }
}
