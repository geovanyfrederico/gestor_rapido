import 'package:gr/models/cliente_model.dart';
import 'package:gr/models/produto_na_venda_model.dart';
import 'package:gr/models/utilizador_model.dart';
import 'package:gr/models/venda_model.dart';
class VisualizarVendaController {
  late VendaModel venda;
  late ClienteModel cliente = ClienteModel(nome: "", nif: "");
  late UtilizadorModel utilizador = UtilizadorModel(nome: "", telefone: "", pin: "", tipo: 1);
  Future<void> init(VendaModel vendaModel) async {
    venda = vendaModel;
    cliente = await venda.cliente;
    utilizador = await venda.utilizador;

  }
  Future<List<ProdutoNaVendaModel>> produtos() async{
    return await venda.produtos;
  }
}
