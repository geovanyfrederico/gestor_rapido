import 'package:gr/core/utils/tempo.dart';
import 'package:gr/models/fornecedor_model.dart';
import 'package:gr/models/database_helper.dart';
import 'package:gr/models/compra_model.dart';
import 'package:sqflite/sqflite.dart';

import '../../../models/utilizador_model.dart';
class RelatoriosComprasController {

  late FornecedorModel fornecedor = FornecedorModel(id:1, nome: 'Consumidor Final', nif: '99999999');
  late DateTime? inicio = Tempo.today().start;
  late DateTime? fim = Tempo.today().end;
  late List<CompraModel> compras = <CompraModel>[];
  late double totalPagar = 0;
  late int totalQtd = 0;
  late double menorCompra = double.infinity;
  late double maiorCompra = 0.0;
  List<FornecedorModel> melhoresFornecedors =  <FornecedorModel>[];
  List<UtilizadorModel> melhoresVendedores =  <UtilizadorModel>[];
  Map<FornecedorModel?, double> comprasPorFornecedor = {};
  Map<UtilizadorModel?, double> comprasPorUtilizador= {};

  Map<UtilizadorModel?, double> fornecedorTop = {};
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
    SELECT * FROM compra WHERE  data BETWEEN ? AND ?
    ''',
        [inicio?.toIso8601String(), fim?.toIso8601String()],
      );
    }

    compras = List.generate(maps.length, (index) {
      return CompraModel.fromMap(maps[index]);
    });

    for (CompraModel element in compras) {
      element.utilizadorModel = await  element.utilizador;
      element.fornecedorModel = await  element.fornecedor;
      totalPagar += element.totalPagar;
      totalQtd += element.totalQtd;
      if (element.totalPagar < menorCompra) {
        menorCompra = element.totalPagar;
      }
      if (element.totalPagar > maiorCompra) {
        maiorCompra = element.totalPagar;
      }
    }
    calcularComprasPorFornecedor();
    calcularComprasUtilizador();
    return true;
  }

  void calcularComprasPorFornecedor() {
    comprasPorFornecedor = {};
    for (CompraModel compra in compras) {
      double valorCompra = compra.totalPagar;
      FornecedorModel? fornecedor = compra.fornecedorModel;
      if (fornecedor != null) {
        int? idFornecedor = fornecedor.id;
        if (comprasPorFornecedor.keys.any((key) => key?.id == idFornecedor)) {
          comprasPorFornecedor.update(
            comprasPorFornecedor.keys.firstWhere((key) => key?.id == idFornecedor),
                (value) => value + valorCompra,
          );
        } else {
          comprasPorFornecedor[fornecedor] = valorCompra;
        }
      }

    }


  }

  void calcularComprasUtilizador() {
    comprasPorUtilizador = {};
    for (CompraModel compra in compras) {
      double valorCompra = compra.totalPagar;
      UtilizadorModel? utilizador = compra.utilizadorModel;
      if (utilizador != null) {
        int? idUtilizador = utilizador.id;
        if (comprasPorUtilizador.keys.any((key) => key?.id == idUtilizador)) {
          comprasPorUtilizador.update(
            comprasPorUtilizador.keys.firstWhere((key) => key?.id == idUtilizador),
                (value) => value + valorCompra,
          );
        } else {
          comprasPorUtilizador[utilizador] = valorCompra;
        }
      }
    }
  }


}
