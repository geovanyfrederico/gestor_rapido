

class ProdutoModel {
    int? id;
    String codigo;
    String nome;
    double preco;
    String foto;
    int stock;
    // List <MovimentoDeStockModel>  movimentoDeStocks;
    // List <ProdutoNaCompra>  produtoNaCompras;
    // List <ProdutoNaVenda>  produtoNaVendas;
    ProdutoModel({
        this.id,
        required this.nome,
        required this.codigo,
        required this.preco,
        required this.stock,
        this.foto = "default.png",
    });

    Map<String, dynamic> toMap() {
        return {
            'id': id,
            'nome': nome,
            'codigo': codigo,
            'preco': preco,
            'foto': foto,
            'stock': stock,
        };
    }
    factory ProdutoModel.fromMap(Map<String, dynamic> map) {
        return ProdutoModel(
            id: map['id'],
            nome: map['nome'],
            codigo: map['codigo'],
            preco: map['preco'],
            foto: map['foto'],
            stock: map['stock']
        );
    }

}