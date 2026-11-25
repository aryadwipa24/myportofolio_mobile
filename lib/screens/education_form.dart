import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class EducationForm extends StatefulWidget {
  const EducationForm({super.key});

  @override
  State<EducationForm> createState() => _EducationFormPageState();
}

class _EducationFormPageState extends State<EducationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _startController = TextEditingController();
  final TextEditingController _endController = TextEditingController();

  String _educationName = "";
  DateTime? _educationStarted;
  DateTime? _educationEnded;
  String _educationEndedStr = "";
  String _educationStartedStr = "";
  String _category = "Pendidikan Wajib";

  final List<String> _categories = [
    'Pendidikan Wajib',
    'Pendidikan Tinggi',
    'Pendidikan Tambahan (Bimbel)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add Education Form')),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      drawer: const LeftDrawer(),

      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Education Name ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Riwayat Pendidikan",
                    labelText: "Nama Riwayat Pendidikan",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _educationName = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Nama riwayat pendidikan tidak boleh kosong.";
                    }
                    return null;
                  },
                ),
              ),

              // === Education Start Date ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _startController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Tanggal Mulai Pendidikan",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    errorMaxLines: 4,
                  ),
                  onTap: () async {
                    DateTime? dt = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );

                    if (dt != null) {
                      setState(() {
                        _educationStarted = dt;
                        _educationStartedStr = dt.toIso8601String().split(
                          'T',
                        )[0];
                        _startController.text = _educationStartedStr;
                      });
                    }
                  },
                  validator: (String? value) {
                    if (_educationStarted == null) {
                      return "Tanggal mulai pendidikan tidak boleh kosong.";
                    }

                    if (_educationStarted!.isAfter(DateTime.now())) {
                      return "Tidak bisa memasukkan tanggal pendidikan di masa depan.";
                    }
                    return null;
                  },
                ),
              ),

              // === Education End Date ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _endController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Tanggal Selesai Pendidikan",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    errorMaxLines: 4,
                    suffix: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          _educationEnded = null;
                          _educationEndedStr = "";
                          _endController.clear();
                        });
                      },
                    ),
                  ),
                  onTap: () async {
                    DateTime? dt = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );

                    if (dt != null) {
                      setState(() {
                        _educationEnded = dt;
                        _educationEndedStr = dt.toIso8601String().split('T')[0];
                        _endController.text = _educationEndedStr;
                      });
                    }
                  },
                  validator: (String? value) {
                    if (_educationStarted != null &&
                        _educationEnded != null &&
                        _educationEnded!.isBefore(_educationStarted!)) {
                      return "Tanggal selesai pendidikan tidak bisa mendahului tanggal mulai pendidikan.";
                    }
                    return null;
                  },
                ),
              ),

              // === Education Category ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Kategori Pendidikan",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  initialValue: _category,
                  items: _categories
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        ),
                      )
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _category = newValue!;
                    });
                  },
                ),
              ),

              Align(
                alignment: AlignmentGeometry.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.indigo),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                "Riwayat pendidikan berhasil ditambahkan!",
                              ),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nama Institusi Pendidikan: $_educationName',
                                    ),
                                    Text("Kategori: $_category"),
                                    Text(
                                      'Tanggal Memulai: $_educationStartedStr',
                                    ),
                                    Text(
                                      'Tanggal Selesai: ${_educationEnded == null ? "Masih Berlangsung" : _educationEndedStr}',
                                    ),
                                  ],
                                ),
                              ),

                              actions: [
                                TextButton(
                                  child: const Text("OK"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();

                                    setState(() {
                                      _educationName = "";
                                      _educationStarted = null;
                                      _educationEnded = null;
                                      _educationStartedStr = "";
                                      _educationEndedStr = "";
                                      _category = "Pendidikan Wajib";
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
