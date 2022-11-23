import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:counter_7/model/budget_model.dart';
import 'package:counter_7/page/drawer.dart';

class BudgetFormPage extends StatefulWidget {
  const BudgetFormPage({super.key});

  final String title = 'Program Counter';

  @override
  State<BudgetFormPage> createState() => _BudgetFormPageState();
}

class _BudgetFormPageState extends State<BudgetFormPage> {
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
        drawer: mainDrawer(context),
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
                              setState(() {
                                listBudget
                                    .add(Budget(_judul, _nominal, _jenis));
                              });
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
