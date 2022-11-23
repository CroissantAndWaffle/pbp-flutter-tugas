import 'package:flutter/material.dart';
import 'package:counter_7/model/budget_model.dart';
import 'package:counter_7/page/drawer.dart';

class BudgetDataPage extends StatefulWidget {
  const BudgetDataPage({super.key});

  final String title = 'Program Counter';

  @override
  State<BudgetDataPage> createState() => _BudgetDataPageState();
}

class _BudgetDataPageState extends State<BudgetDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Budget'),
      ),
      drawer: mainDrawer(context),
      body: ListView(
        padding: const EdgeInsets.all(15), // sets all padding to 15
        children: [
          for (Budget data in listBudget)
            Card(
              elevation: 2.0,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 10),
                      Text(
                        data.judul,
                        style: const TextStyle(fontSize: 40),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(width: 10),
                      Text(
                        '${data.nominal}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      Expanded(child: Container()),
                      Text(
                        data.jenis,
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
