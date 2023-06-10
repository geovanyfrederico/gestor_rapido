class MovimentoDeStockModel {
    int id;
    int produtoId;
    int utilizadorId;
    DateTime data;
    int qtd;
    String ref;
    String tipo;

    MovimentoDeStockModel({
        required this.id,
        required this.produtoId,
        required this.utilizadorId,
        required this.data,
        required this.qtd,
        required this.ref,
        required this.tipo,
    });

    Map<String, dynamic> toMap() {
        return {
            'id': id,
            'produtoId': produtoId,
            'utilizadorId': utilizadorId,
            'data': data,
            'qtd': qtd,
            'ref': ref,
            'tipo': tipo,
        };
    }

    factory MovimentoDeStockModel.fromMap(Map<String, dynamic> map) {
        return MovimentoDeStockModel(
            id: map['id'],
            produtoId: map['produtoId'],
            utilizadorId: map['utilizadorId'],
            data: map['data'],
            qtd: map['qtd'],
            ref: map['ref'],
            tipo: map['tipo'],
        );
    }
}



