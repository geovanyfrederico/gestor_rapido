
class CompraModel {
    int id;
    int fornecedorId;
    int utilizadorId;
    DateTime data;
    int totalQtd;
    double totalPagar;
    double totalPago;
    double troco;
    /* Fornecedor fornecedor;
  Utilizador utilizador;*/

    CompraModel({
        required this.id,
        required this.fornecedorId,
        required this.utilizadorId,
        required this.data,
        required this.totalQtd,
        required this.totalPagar,
        required this.totalPago,
        this.troco = 0,
    });

    Map<String, dynamic> toMap() {
        return {
            'id': id,
            'fornecedorId': fornecedorId,
            'utilizadorId': utilizadorId,
            'data': data,
            'totalQtd': totalQtd,
            'totalPagar': totalPagar,
            'totalPago': totalPago,
            'troco': troco,
        };
    }
    factory CompraModel.fromMap(Map<String, dynamic> map) {
        return CompraModel(
            id: map['id'],
            fornecedorId: map['fornecedorId'],
            utilizadorId: map['utilizadorId'],
            data: map['data'],
            totalQtd: map['totalQtd'],
            totalPagar: map['totalPagar'],
            totalPago: map['totalPago'],
            troco: map['troco'],
        );
    }
}
