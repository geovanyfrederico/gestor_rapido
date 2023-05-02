import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late String _tipoRelatorioSelecionado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escolha o tipo de relatório'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Text('Relatório de Funcionários'),
              leading: Radio(
                value: 'funcionarios',
                groupValue: _tipoRelatorioSelecionado,
                onChanged: ( value) {
                  setState(() {
                    _tipoRelatorioSelecionado = value.toString();
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Relatório de Produtos'),
              leading: Radio(
                value: 'produtos',
                groupValue: _tipoRelatorioSelecionado,
                onChanged: (value) {
                  setState(() {
                    _tipoRelatorioSelecionado = value.toString();
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Relatório Periódico'),
              leading: Radio(
                value: 'periodico',
                groupValue: _tipoRelatorioSelecionado,
                onChanged: (value) {
                  setState(() {
                    _tipoRelatorioSelecionado = value.toString();
                  });
                },
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (_tipoRelatorioSelecionado == null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Selecione um tipo de relatório'),
                  ));
                } else {
                  // Chamar a tela de relatório desejada aqui
                  print('Tipo de relatório selecionado: $_tipoRelatorioSelecionado');
                }
              },
              child: Text('Gerar Relatório'),
            ),
          ],
        ),
      ),
    );
  }
}
