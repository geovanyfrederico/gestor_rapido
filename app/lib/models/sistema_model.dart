import 'package:gr/models/movimento_de_stock_model.dart';
import 'package:gr/models/produto_na_compra_model.dart';
import 'package:gr/models/produto_na_venda_model.dart';

class SistemaModel {
    int id;
    String nome;
    String tipo;
    SistemaModel({
        required this.id,
        required this.nome,
        required this.tipo,
    });

    Map<String, dynamic> toMap() {
        return {
            'id': id,
            'nome': nome,
            'tipo': tipo,
        };
    }
    factory SistemaModel.fromMap(Map<String, dynamic> map) {
        return SistemaModel(
            id: map['id'],
            nome: map['nome'],
            tipo: map['tipo'],
        );
    }
}
