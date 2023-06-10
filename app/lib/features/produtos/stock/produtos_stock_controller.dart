import 'package:gr/models/movimento_de_stock_model.dart';
import 'package:sqflite/sqflite.dart';
import '../../../models/database_helper.dart';
import '../../../models/produto_model.dart';
class ProdutosStockController {

  late ProdutoModel produto;
  late List<MovimentoDeStockModel> movimentos = <MovimentoDeStockModel>[];
  Future<void> init(ProdutoModel produtoInited) async {
    produto = produtoInited;
    await load();
  }
  Future<void> load() async {
    Database db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> maps = await db.query('movimentoDeStock',
        orderBy: 'id DESC',
        where: 'produtoId = ? ',
        whereArgs: [produto.id]);
    movimentos =  List.generate(maps.length, (index) {
      return MovimentoDeStockModel.fromMap(maps[index]);
    });

  }

}
