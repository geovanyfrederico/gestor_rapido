class MovimentoDeStockModel {
    int id;
    int produtoId;
    int usuarioId;
    DateTime data;
    int qtd;
    String ref;
    String tipo;

    MovimentoDeStockModel({
        required this.id,
        required this.produtoId,
        required this.usuarioId,
        required this.data,
        required this.qtd,
        required this.ref,
        required this.tipo,
    });

    Map<String, dynamic> toMap() {
        return {
            'id': id,
            'produtoId': produtoId,
            'usuarioId': usuarioId,
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
            usuarioId: map['usuarioId'],
            data: map['data'],
            qtd: map['qtd'],
            ref: map['ref'],
            tipo: map['tipo'],
        );
    }
}



