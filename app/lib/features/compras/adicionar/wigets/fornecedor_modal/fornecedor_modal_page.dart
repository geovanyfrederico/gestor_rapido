import 'package:flutter/material.dart';
import 'package:gr/models/fornecedor_model.dart';
import 'fornecedor_modal_controller.dart';



class FornecedorModalPage extends StatefulWidget {
  const FornecedorModalPage({Key? key, this.callback}) : super(key: key);
  final Function(FornecedorModel)? callback;
  @override
  FornecedorModalState createState() => FornecedorModalState();
}

class FornecedorModalState extends State<FornecedorModalPage> {
  final FornecedorModalController controller =
  FornecedorModalController();

  @override
  void initState() {
    super.initState();
    // Inicializa a lista de items
    iniProdutoNoCarrinho();
  }

  void _adicionar(FornecedorModel item) {
    widget.callback?.call(item);
  }

  Future<void> iniProdutoNoCarrinho() async {
    await controller.index();
    setState(() {});
  }

  Future<void> filtrar(String value) async {
    if (value.isNotEmpty) {
      await controller.filtrar(value);
      setState(() {});
    } else {
      iniProdutoNoCarrinho();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Selecionar Fornecedor',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: controller.items.length,
              itemBuilder: (context, index) {
                return _buildProductItem(
                    controller.items[index]);
              },
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            onChanged: (value) => filtrar(value),
            decoration: const InputDecoration(
              hintText: 'Escreva para filtrar',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.qr_code),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(FornecedorModel item) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ListTile(
          onTap: () {
            _adicionar(item);
             Navigator.pop(context);
          },
          title: Text(
            item.nome,
            style: const TextStyle(fontSize: 18),
          ),
          subtitle: Text("NIF: " + item.nif),
        ),
      ),
    );
  }
}
