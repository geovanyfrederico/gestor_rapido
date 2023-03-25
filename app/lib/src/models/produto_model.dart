import 'package:gr/src/models/movimento_de_stock_model.dart';
import 'package:gr/src/models/produto_na_compra_model.dart';
import 'package:gr/src/models/produto_na_venda_model.dart';

class ProdutoModel {
    int id;
    String nome;
    double preco;
    String foto;
    int stock;
    // List <MovimentoDeStockModel>  movimentoDeStocks;
    // List <ProdutoNaCompra>  produtoNaCompras;
    // List <ProdutoNaVenda>  produtoNaVendas;
    ProdutoModel({
        required this.id,
        required this.nome,
        required this.preco,
        required this.stock,
        this.foto = "default.png",
    });

    Map<String, dynamic> toMap() {
        return {
            'id': id,
            'nome': nome,
            'preco': preco,
            'foto': foto,
            'stock': stock,
        };
    }
    factory ProdutoModel.fromMap(Map<String, dynamic> map) {
        return ProdutoModel(
            id: map['id'],
            nome: map['nome'],
            preco: map['preco'],
            foto: map['foto'],
            stock: map['stock']
        );
    }
}
