class ClienteModel {
    final int id;
    late final String nome;
    late final String endereco;
    late final String telefone;
    //List<VendaModel> vendas = [];
    ClienteModel({
        this.id = 0,
        required this.nome,
        this.endereco = "",
        this.telefone = ""
    });

    Map<String, dynamic> toMap() {
        return {
            'id': id,
            'nome': nome,
            'telefone': telefone,
            'endereco': endereco ,
        };
    }

    factory ClienteModel.fromMap(Map<String, dynamic> map) {
        return ClienteModel(
            id: map['id'],
            nome: map['nome'],
            endereco: map['endereco'],
            telefone: map['telefone'],
        );
    }
   /* List<VendaModel> obterVendas() {
        return vendas.where((venda) => venda.clienteId == id).toList();
    }*/
}


