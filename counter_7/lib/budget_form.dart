import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/budget_data.dart';

class BudgetFormPage extends StatefulWidget {
  BudgetFormPage({super.key, this.counter = 0, this.listBudget = const []});

  final String title = 'Program Counter';
  int counter;
  List<Budget> listBudget;

  @override
  State<BudgetFormPage> createState() =>
      _BudgetFormPageState(counter: counter, listBudget: listBudget);
}

class Budget {
  String judul;
  int nominal;
  String jenis;

  Budget(this.judul, this.nominal, this.jenis);
}

class _BudgetFormPageState extends State<BudgetFormPage> {
  _BudgetFormPageState({this.counter = 0, this.listBudget = const []});
  int counter;
  List<Budget> listBudget;
  final _formKey = GlobalKey<FormState>();
  String _judul = '';
  int _nominal = 0;
  String _jenis = 'Pemasukan';
  final List<String> _listJenis = ['Pemasukan', 'Pengeluaran'];

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
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Padding(
                          // Menggunakan padding sebesar 8 pixels
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Judul",
                              // Menambahkan circular border agar lebih rapi
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            // Menambahkan behavior saat nama diketik
                            onChanged: (String? value) {
                              setState(() {
                                _judul = value!;
                              });
                            },
                            // Menambahkan behavior saat data disimpan
                            onSaved: (String? value) {
                              setState(() {
                                _judul = value!;
                              });
                            },
                            // Validator sebagai validasi form
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Judul tidak boleh kosong!';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          // Menggunakan padding sebesar 8 pixels
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Nominal",
                              // Menambahkan circular border agar lebih rapi
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            // Menambahkan behavior saat nama diketik
                            onChanged: (String? value) {
                              setState(() {
                                _nominal = int.parse(value!);
                              });
                            },
                            // Menambahkan behavior saat data disimpan
                            onSaved: (String? value) {
                              setState(() {
                                _nominal = int.parse(value!);
                              });
                            },
                            // Validator sebagai validasi form
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Nominal tidak boleh kosong!';
                              }
                              return null;
                            },
                          ),
                        ),
                        Center(
                          child: DropdownButton(
                            value: _jenis,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: _listJenis.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _jenis = newValue!;
                              });
                            },
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Budget newBudget =
                                  Budget(_judul, _nominal, _jenis);
                              listBudget.add(newBudget);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BudgetFormPage(
                                        counter: counter,
                                        listBudget: listBudget)),
                              );
                            }
                          },
                          child: const Text(
                            "Simpan",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    )))));
  }
}
