// ignore_for_file: unused_field, unused_element, unused_local_variable, deprecated_member_use, sort_child_properties_last

import 'package:flutter/material.dart';

class RegistrationData {
  final String nama;
  final String email;
  final String city;
  final String gender;
  final DateTime? birthdate;
  final bool agree;

  const RegistrationData({
    required this.nama,
    required this.email,
    required this.city,
    required this.gender,
    required this.birthdate,
    required this.agree,
  });
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscure = true;
  bool _agree = false;
  String? _gender;
  String? _kotaLahir;
  DateTime? _tanggalLahir;

  final _nama = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _tgllhrtext = TextEditingController();
  final List<String> _kota = const <String>[
    'Jakarta',
    'Bandung',
    'Surabaya',
    'Batam',
    'Pontianak',
    'Semarang',
    'Yogyakarta',
  ];

  String? _required(String? v) {
    if (v == null || v.isEmpty) {
      return 'Wajib diisi';
    }
    return null;
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 100);
    final lastDate = DateTime(now.year + 1);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 20, now.month, now.day),
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (pickedDate != null) {
      setState(() {
        _tanggalLahir = pickedDate;
        _tgllhrtext.text = '${pickedDate.day.toString().padLeft(2, '0')}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.year}';
      });
    }
  }

  void onChanged(String? value) => setState(() => _kotaLahir = value);

  void _submit() {
    if (!_agree) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Centang persetujuan terlebih dahulu!')),
      );
      return;
    }
    if (!_formKey.currentState!.validate()) {
      return; 
    }
    _formKey.currentState!.save();
    final data = RegistrationData(
      nama: _nama.text.trim(),
      email: _email.text.trim(),
      city: _kotaLahir ?? '',
      gender: _gender ?? '-',
      birthdate: _tanggalLahir,
      agree: _agree,
    );
    Navigator.of(context).pushNamed('/home',arguments: data);
  }

  void _onPressed() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    _submit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registrasi")),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nama,
                  decoration: const InputDecoration(labelText: "Nama"),
                  validator: _required,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(labelText: "Email"),
                  validator: _required,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _password,
                  decoration: InputDecoration(
                    labelText: "Password",
                    suffixIcon: IconButton(
                      icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () => setState(() => _obscure = !_obscure),
                      tooltip: _obscure ? 'tampilkan' : 'Sembuyikan',
                    ),
                  ),
                  obscureText: _obscure,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 12),

                const Text("Jenis Kelamin", style: TextStyle(fontWeight: FontWeight.w600)),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text("Laki-laki"),
                        value: "L",
                        groupValue: _gender,
                        onChanged: (V) => setState(() => _gender = V),
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text("Perempuan"),
                        value: "P",
                        groupValue: _gender,
                        onChanged: (V) => setState(() => _gender = V),
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: "Kota Lahir"),
                  items: _kota.map((e) => DropdownMenuItem<String>(child: Text(e), value: e,)).toList(),
                  onChanged: onChanged,
                  value: _kotaLahir,
                ),
                const SizedBox(height: 12),
                
                TextFormField(
                  controller: _tgllhrtext,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Tanggal Lahir",
                    suffixIcon: IconButton(
                      onPressed: _pickDate,
                      icon: const Icon(Icons.date_range),
                      tooltip: 'Pilih Tanggal',
                    ),
                  ),
                  onTap: _pickDate,
                ),
                const SizedBox(height: 12),

                CheckboxListTile(
                  value: _agree,
                  onChanged: (v) => setState(() => _agree = v ?? false),
                  title: const Text("Saya menyetujui syarat dan ketentuan"),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                const SizedBox(height: 12),

                SizedBox(width: double.infinity, 
                  child: ElevatedButton.icon(
                    onPressed: _onPressed, 
                    icon: const Icon(Icons.check),
                    label: const Text("Daftar"),)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}