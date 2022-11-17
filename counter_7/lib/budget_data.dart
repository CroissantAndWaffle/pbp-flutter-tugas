import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/budget_form.dart';

class BudgetDataPage extends StatefulWidget {
  BudgetDataPage({super.key, this.counter = 0, this.listBudget = const []});

  final String title = 'Program Counter';
  int counter;
  List<Budget> listBudget;

  @override
  State<BudgetDataPage> createState() =>
      _BudgetDataPageState(counter: counter, listBudget: listBudget);
}

class _BudgetDataPageState extends State<BudgetDataPage> {
  _BudgetDataPageState({this.counter = 0, this.listBudget = const []});
  int counter;
  List<Budget> listBudget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Budget'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // Menambahkan clickable menu
            ListTile(
              title: const Text('counter_7'),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(
                            counter: counter,
                            listBudget: listBudget,
                          )),
                );
              },
            ),
            ListTile(
              title: const Text('Tambah Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BudgetFormPage(
                            counter: counter,
                            listBudget: listBudget,
                          )),
                );
              },
            ),
            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BudgetDataPage(
                            counter: counter,
                            listBudget: listBudget,
                          )),
                );
              },
            ),
          ],
        ),
      ),
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
