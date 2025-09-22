// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:registrasi/pages/register_page.dart';

class HomePages extends StatelessWidget {
  final RegistrationData data;

  const HomePages({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Registrasi Berhasil!',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 12),
              Text('Nama: ${data.nama}'),
              Text('Email: ${data.email}'),
              Text('Kota Lahir: ${data.city}'),
              Text('Tanggal Lahir: ${data.birthdate}'),
              Text('Jenis Kelamin: ${data.gender}'),
            ],
          ),
        ),
      ),
    );
  }
}