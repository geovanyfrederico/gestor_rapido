import 'package:gr/models/fornecedor_model.dart';
import 'package:gr/models/produto_na_compra_model.dart';
import 'package:gr/models/utilizador_model.dart';
import 'package:sqflite/sqflite.dart';
import 'fornecedor_model.dart';
import 'database_helper.dart';

class CompraModel {
    int? id;
    int? fornecedorId;
    int? utilizadorId;
    String data;
    int totalQtd;
    double totalPagar;
    double totalPago;
    double troco;
    FornecedorModel? fornecedorModel;
    UtilizadorModel? utilizadorModel;

    Future<List<ProdutoNaCompraModel>> get produtos async {
        return await ProdutoNaCompraModel.findAllByVendaId(id!);
    }
    Future<FornecedorModel> get fornecedor async {
        fornecedorModel ??= await FornecedorModel.findOneById(fornecedorId!);
        return fornecedorModel!;
    }
    Future<UtilizadorModel> get utilizador async {
        utilizadorModel ??= await UtilizadorModel.findOneById(utilizadorId!);
        return utilizadorModel!;

    }
    CompraModel({
        this.id,
        this.fornecedorId,
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
            'fornecedorId':fornecedorId,
            'utilizadorId':utilizadorId,
            'data':data,
            'totalQtd':totalQtd,
            'totalPagar':totalPagar,
            'totalPago':totalPago,
            'troco':troco,
        };
    }

    factory CompraModel.fromMap(Map<String, dynamic> map) {

        return CompraModel(
            id: map['id'],
            fornecedorId: map['fornecedorId'],
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
        return db.insert('compra', toMap());
    }
    static  Future<List<CompraModel>> comprasDiarias() async {
        final Database database = await  DatabaseHelper.instance.database;

        final DateTime now = DateTime.now();
        final DateTime startOfDay = DateTime(now.year, now.month, now.day);
        final DateTime endOfDay = startOfDay.add(const Duration(days: 1));
        final List<Map<String, dynamic>> maps = await database.rawQuery('''
    SELECT * FROM compra
    WHERE data BETWEEN ? AND ?
  ''', [startOfDay.toIso8601String(), endOfDay.toIso8601String()]);

        return List.generate(maps.length, (index) {
            return CompraModel.fromMap(maps[index]);
        });

    }

    static  Future<List<CompraModel>> comprasSemanais() async {

        final Database database = await  DatabaseHelper.instance.database;

        final DateTime now = DateTime.now();
        final DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
        final DateTime endOfWeek = startOfWeek.add(Duration(days: 7));

        final List<Map<String, dynamic>> maps = await database.rawQuery(''' SELECT * FROM compra WHERE data BETWEEN ? AND ? ''', [startOfWeek.toIso8601String(), endOfWeek.toIso8601String()]);

        return List.generate(maps.length, (index) {
            return CompraModel.fromMap(maps[index]);
        });
    }

    static Future<List<CompraModel>> comprasMensais() async {

        final Database database = await  DatabaseHelper.instance.database;
        final DateTime now = DateTime.now();
        final DateTime startOfMonth = DateTime(now.year, now.month, 1);
        final DateTime endOfMonth = DateTime(now.year, now.month + 1, 1).subtract(Duration(days: 1));
        final List<Map<String, dynamic>> maps = await database.rawQuery(''' SELECT * FROM compra WHERE data BETWEEN ? AND ? ''', [startOfMonth.toIso8601String(), endOfMonth.toIso8601String()]);

        return List.generate(maps.length, (index) {
            return CompraModel.fromMap(maps[index]);
        });
    }

}
