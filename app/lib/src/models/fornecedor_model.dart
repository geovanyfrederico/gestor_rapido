class FornecedorModel {
    final int id;
    late final String nome;
    late final String endereco;
    late final String telefone;
    late final String nif;
    //List<VendaModel> vendas = [];
    FornecedorModel({
        this.id = 0,
        required this.nome,
        required this.nif,
        this.endereco = "",
        this.telefone = ""
    });

    Map<String, dynamic> toMap() {
        return {
            'id': id,
            'nome': nome,
            'telefone': telefone,
            'endereco': endereco ,
            'nif': nif ,
        };
    }

    factory FornecedorModel.fromMap(Map<String, dynamic> map) {
        return FornecedorModel(
            id: map['id'],
            nome: map['nome'],
            endereco: map['endereco'],
            telefone: map['telefone'],
            nif: map['nif'],
        );
    }

}


