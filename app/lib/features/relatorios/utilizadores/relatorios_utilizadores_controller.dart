import 'dart:developer';

import 'package:gr/core/utils/tempo.dart';
import 'package:gr/models/utilizador_model.dart';
import 'package:gr/models/database_helper.dart';
import 'package:gr/models/venda_model.dart';
import 'package:sqflite/sqflite.dart';

import '../../../models/cliente_model.dart';
class RelatoriosUtilizadoresController {

  late UtilizadorModel utilizador  = UtilizadorModel(id:0, nome: 'Selecione um utilizador', telefone: '', pin: '', tipo:0);
  late DateTime? inicio = Tempo.today().start;
  late DateTime? fim = Tempo.today().end;
  late List<VendaModel> vendas = <VendaModel>[];
  late double totalPagar = 0;
  late int totalQtd = 0;
  late double menorVenda = double.infinity;
  late double maiorVenda = 0.0;

  void clear(){
    totalPagar = 0;
    totalQtd = 0;
    menorVenda = double.infinity;
    maiorVenda = 0.0;
    vendas = <VendaModel>[];
  }
  void setUtilizador(UtilizadorModel utilizadorSet) {
    utilizador = utilizadorSet;
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
    SELECT * FROM venda WHERE  data = ? AND utilizadorId = ?
    ''',
        [inicio?.toIso8601String(), utilizador.id],
      );
    }else{
      maps = await database.rawQuery(
        '''
    SELECT * FROM venda WHERE  data BETWEEN ? AND ? AND utilizadorId = ?
    ''',
        [inicio?.toIso8601String(), fim?.toIso8601String(), utilizador.id],
      );
    }

    vendas = List.generate(maps.length, (index) {
      return VendaModel.fromMap(maps[index]);
    });

    for (VendaModel element in vendas) {
      element.utilizadorModel = await  element.utilizador;

      totalPagar += element.totalPagar;
      totalQtd += element.totalQtd;
      if (element.totalPagar < menorVenda) {
        menorVenda = element.totalPagar;
      }
      if (element.totalPagar > maiorVenda) {
        maiorVenda = element.totalPagar;
      }
    }

    return true;
  }

  Future<void> getDefaultUtilizador() async {
    if(utilizador.id ==0){
      utilizador = await UtilizadorModel.findOneById(1);
    }
  }

}
