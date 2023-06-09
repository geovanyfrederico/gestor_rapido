import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:gr/core/utils/tempo.dart';
import 'package:gr/models/cliente_model.dart';
import 'package:gr/models/database_helper.dart';
import 'package:gr/models/venda_model.dart';
import 'package:sqflite/sqflite.dart';

import '../../../models/utilizador_model.dart';
class RelatoriosVendasController {

  late ClienteModel cliente = ClienteModel(id:1, nome: 'Consumidor Final', nif: '99999999');
  late DateTime? inicio = Tempo.today().start;
  late DateTime? fim = Tempo.today().end;
  late List<VendaModel> vendas = <VendaModel>[];
  late double totalPagar = 0;
  late int totalQtd = 0;
  late double menorVenda = double.infinity;
  late double maiorVenda = 0.0;
  List<ClienteModel> melhoresClientes =  <ClienteModel>[];
  List<UtilizadorModel> melhoresVendedores =  <UtilizadorModel>[];
  Map<ClienteModel?, double> vendasPorCliente = {};
  Map<UtilizadorModel?, double> vendasPorUtilizador= {};

  Map<UtilizadorModel?, double> clienteTop = {};
  void clear(){
    totalPagar = 0;
    totalQtd = 0;
    menorVenda = double.infinity;
    maiorVenda = 0.0;
    vendas = <VendaModel>[];
  }
  void setCliente(ClienteModel clienteSet) {
    cliente = clienteSet;
  }


  void setTime(DateTime?  inicioStr, DateTime?  fimStr) {
    inicio = inicioStr;
    fim = fimStr;
  }

  Future<bool> gerarRelatorios() async {
    clear();
    final Database database = await DatabaseHelper.instance.database;
    late List<Map<String, dynamic>> maps = [];
    if(inicio?.toIso8601String() == fim?.toIso8601String()){
      maps = await database.rawQuery(
        '''
    SELECT * FROM venda WHERE  data = ? AND clienteId = ?
    ''',
        [inicio?.toIso8601String(), cliente.id],
      );
    }else{
      maps = await database.rawQuery(
        '''
    SELECT * FROM venda WHERE  data BETWEEN ? AND ?
    ''',
        [inicio?.toIso8601String(), fim?.toIso8601String()],
      );
    }

    vendas = List.generate(maps.length, (index) {
      return VendaModel.fromMap(maps[index]);
    });

    for (VendaModel element in vendas) {
      element.utilizadorModel = await  element.utilizador;
      element.clienteModel = await  element.cliente;
      totalPagar += element.totalPagar;
      totalQtd += element.totalQtd;
      if (element.totalPagar < menorVenda) {
        menorVenda = element.totalPagar;
      }
      if (element.totalPagar > maiorVenda) {
        maiorVenda = element.totalPagar;
      }
    }
    calcularVendasPorCliente();
    calcularVendasUtilizador();
    return true;
  }

  void calcularVendasPorCliente() {
    vendasPorCliente = {};
    for (VendaModel venda in vendas) {
      double valorVenda = venda.totalPagar;
      ClienteModel? cliente = venda.clienteModel;
      if (cliente != null) {
        int? idCliente = cliente.id;
        if (vendasPorCliente.keys.any((key) => key?.id == idCliente)) {
          vendasPorCliente.update(
            vendasPorCliente.keys.firstWhere((key) => key?.id == idCliente),
                (value) => value + valorVenda,
          );
        } else {
          vendasPorCliente[cliente] = valorVenda;
        }
      }

    }


  }

  void calcularVendasUtilizador() {
    vendasPorUtilizador = {};
    for (VendaModel venda in vendas) {
      double valorVenda = venda.totalPagar;
      UtilizadorModel? utilizador = venda.utilizadorModel;
      if (utilizador != null) {
        int? idUtilizador = utilizador.id;
        if (vendasPorUtilizador.keys.any((key) => key?.id == idUtilizador)) {
          vendasPorUtilizador.update(
            vendasPorUtilizador.keys.firstWhere((key) => key?.id == idUtilizador),
                (value) => value + valorVenda,
          );
        } else {
          vendasPorUtilizador[utilizador] = valorVenda;
        }
      }
    }
  }


}
