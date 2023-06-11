import 'dart:developer';

import 'package:gr/core/utils/tempo.dart';
import 'package:gr/models/fornecedor_model.dart';
import 'package:gr/models/database_helper.dart';
import 'package:gr/models/compra_model.dart';
import 'package:sqflite/sqflite.dart';
class RelatoriosFornecedoresController {

  late FornecedorModel fornecedor = FornecedorModel(id:1, nome: 'Fornecedor Final', nif: '99999999');
  late DateTime? inicio = Tempo.today().start;
  late DateTime? fim = Tempo.today().end;
  late List<CompraModel> compras = <CompraModel>[];
  late double totalPagar = 0;
  late int totalQtd = 0;
  late double menorCompra = double.infinity;
  late double maiorCompra = 0.0;

  void clear(){
    totalPagar = 0;
    totalQtd = 0;
    menorCompra = double.infinity;
    maiorCompra = 0.0;
    compras = <CompraModel>[];
  }
  void setFornecedor(FornecedorModel fornecedorSet) {
    fornecedor = fornecedorSet;
  }


  void setTime(DateTime?  inicioStr, DateTime?  fimStr) {
    inicio = inicioStr;
    fim = fimStr;
  }

  Future<bool> gerarRelatorios() async {
    clear();
  log("${inicio?.toIso8601String()}, ${fim?.toIso8601String()}, ${fornecedor.id} - ${fornecedor.nome}");
    final Database database = await DatabaseHelper.instance.database;
    late List<Map<String, dynamic>> maps = [];
    if(inicio?.toIso8601String() == fim?.toIso8601String()){
      maps = await database.rawQuery(
        '''
    SELECT * FROM compra WHERE  data = ? AND fornecedorId = ?
    ''',
        [inicio?.toIso8601String(), fornecedor.id],
      );
    }else{
      maps = await database.rawQuery(
        '''
    SELECT * FROM compra WHERE  data BETWEEN ? AND ? AND fornecedorId = ?
    ''',
        [inicio?.toIso8601String(), fim?.toIso8601String(), fornecedor.id],
      );
    }

    compras = List.generate(maps.length, (index) {
      return CompraModel.fromMap(maps[index]);
    });

    for (CompraModel element in compras) {
      element.utilizadorModel = await  element.utilizador;

      totalPagar += element.totalPagar;
      totalQtd += element.totalQtd;
      if (element.totalPagar < menorCompra) {
        menorCompra = element.totalPagar;
      }
      if (element.totalPagar > maiorCompra) {
        maiorCompra = element.totalPagar;
      }
    }

    return true;
  }

}
