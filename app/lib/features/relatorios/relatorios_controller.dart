import 'package:sqflite/sqflite.dart';
import '../../core/utils/mat.dart';
import '../../models/database_helper.dart';
import '../../models/venda_model.dart';

class RelatoriosController{

  late double vendasDiarias = 0;
  late double vendasMensais = 0;
  late double vendasSemanais = 0;


  String get vendasDiariasDinheiro  {
    return Mat.numeroParaDinheiro(vendasDiarias);
  }
  String get vendasMensaisDinheiro  {
    return Mat.numeroParaDinheiro(vendasMensais);
  }
  String get vendasSemanaisDinheiro{
    return Mat.numeroParaDinheiro(vendasSemanais);
  }

  Future<void> init() async {
    // Atribuir os valores de venda
    vendasDiarias = countTotalVendas(await VendaModel.vendasDiarias());
    vendasSemanais = countTotalVendas(await VendaModel.vendasSemanais());
    vendasMensais = countTotalVendas(await VendaModel.vendasMensais());
  }

  Future<List<VendaModel>> ultimasVendas() async {
    Database db = await DatabaseHelper.instance.database;
    String query = 'SELECT * FROM venda ORDER BY data DESC LIMIT 10 ';
    List<Map<String, dynamic>> maps = await db.rawQuery(query);
    return List.generate(maps.length, (index) {
      return VendaModel.fromMap(maps[index]);
    });
  }


  double countTotalVendas(List<VendaModel> vendas){
    double vendaTotal = 0;
    vendas.forEach((venda) {
      vendaTotal += venda.totalPagar;
    });
    return vendaTotal;
  }
}
