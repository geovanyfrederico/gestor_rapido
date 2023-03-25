class EmpresaModel {
    final int id;
    late final String nome;
    late final String endereco;
    late final String telefone;
    late final String nif;
    late final String logo;

    EmpresaModel({
        this.id = 0,
        required this.nome,
        required this.nif ,
        this.endereco = "",
        this.telefone = "",
        this.logo = ""
    });

    Map<String, dynamic> toMap() {
        return {
            'id': id,
            'nome': nome,
            'telefone': telefone,
            'endereco': endereco ,
            'nif': nif ,
            'logo': logo ,
        };
    }

    factory EmpresaModel.fromMap(Map<String, dynamic> map) {
        return EmpresaModel(
            id: map['id'],
            nome: map['nome'],
            endereco: map['endereco'],
            telefone: map['telefone'],
            nif: map['nif'],
            logo: map['logo'],
        );
    }
}



