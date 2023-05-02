import 'package:flutter/material.dart';
import 'package:gr/wigets/menu_drawer.dart';

class DashboardPage extends StatefulWidget {
   const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<Sale> _sales = [    Sale(date: '2023-04-20', amount: 120.50),    Sale(date: '2023-04-19', amount: 78.90),    Sale(date: '2023-04-18', amount: 250.00),    Sale(date: '2023-04-17', amount: 90.25),    Sale(date: '2023-04-16', amount: 150.00),  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer: const MenuDrawer(),
      appBar: AppBar(
        title: const Text('Resumo de Vendas'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: Colors.orange,

                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const [
                          Text(
                            'Hoje',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            '120.50 Kz',
                            style: TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const [
                          Text(
                            'Esta semana',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            '120.50 Kz',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'Mês',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8.0),
                          const Text(
                            '789.65 Kz',
                            style: const TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32.0),
            const Text(
              'Últimas Vendas',
              style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _sales.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('Data: ${_sales[index].date}'),
                      subtitle: Text('Valor: ${_sales[index].amount.toStringAsFixed(2)} kz'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Sale {
  final String date;
  final double amount;

  Sale({required this.date, required this.amount});
}
