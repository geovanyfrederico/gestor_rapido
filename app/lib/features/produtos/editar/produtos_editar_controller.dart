import 'package:gr/models/cliente_model.dart';
import 'package:gr/models/produto_na_venda_model.dart';
import 'package:gr/models/utilizador_model.dart';
import 'package:gr/models/venda_model.dart';

import '../../../models/produto_model.dart';
class ProdutosEditarController {
  late ProdutoModel produto;
  Future<void> init(ProdutoModel produtoInited) async {
    produto = produtoInited;
  }
}
