import 'package:gr/models/cliente_model.dart';
import 'package:gr/models/produto_na_compra_model.dart';
import 'package:gr/models/utilizador_model.dart';
import 'package:gr/models/compra_model.dart';
class VisualizarCompraController {
  late CompraModel compra;
  late ClienteModel cliente = ClienteModel(nome: "", nif: "");
  late UtilizadorModel utilizador = UtilizadorModel(nome: "", telefone: "", pin: "", tipo: 1);
  Future<void> init(CompraModel compraModel) async {
    compra = compraModel;
    cliente = await compra.cliente;
    utilizador = await compra.utilizador;

  }
  Future<List<ProdutoNaCompraModel>> produtos() async{
    return await compra.produtos;
  }
}
