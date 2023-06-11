import 'package:gr/models/fornecedor_model.dart';
import 'package:gr/models/produto_na_compra_model.dart';
import 'package:gr/models/utilizador_model.dart';
import 'package:gr/models/compra_model.dart';
class VisualizarCompraController {
  late CompraModel compra;
  late FornecedorModel fornecedor = FornecedorModel(nome: "", nif: "");
  late UtilizadorModel utilizador = UtilizadorModel(nome: "", telefone: "", pin: "", tipo: 1);
  Future<void> init(CompraModel compraModel) async {
    compra = compraModel;
    fornecedor = await compra.fornecedor;
    utilizador = await compra.utilizador;

  }
  Future<List<ProdutoNaCompraModel>> produtos() async{
    return await compra.produtos;
  }
}
