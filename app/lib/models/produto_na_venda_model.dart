import 'package:gr/models/produto_model.dart';
class ProdutoNaVendaModel {
    int id;
    int produtoId;
    int qtd;
    String nome;
    double preco;
    double precoTotal;
    ProdutoModel produto;
    ProdutoNaVendaModel({
        required this.id,
        required this.produtoId,
        required this.qtd,
        required this.nome,
        required this.preco,
        required this.precoTotal,
        required this.produto
    });

    // List <MovimentoDeStockModel>  movimentoDeStocks;
    // List <ProdutoNaCompra>  produtoNaCompras;
    // List <ProdutoNaVenda>  produtoNaVendas;

    Map<String, dynamic> toMap() {
        return {
            'id': id,
            'nome': nome,
            'preco': preco,
            'produtoId': produtoId,
            'precoTotal': precoTotal,
            'qtd': qtd,

        };
    }
    factory ProdutoNaVendaModel.fromMap(Map<String, dynamic> map) {
        return ProdutoNaVendaModel(
            id:map['id'],
            produtoId: map['produtoId'],
            qtd : map['qtd'],
            nome: map['nome'],
            preco:map['preco'],
            precoTotal:map['precoTotal'],
            produto: map['produto']
        );
    }
}
