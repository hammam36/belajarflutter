import 'package:flutter/material.dart';

class MyBiodata extends StatelessWidget {
  const MyBiodata({super.key}); // Hilangkan parameter title

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('٩(◕‿◕｡)۶ Biodata Hammam'), // Judul di-hardcode di sini
        backgroundColor: const Color.fromARGB(255, 58, 183, 89),
      ),
      body: const Center(
        child: Text(
          'Nama Lengkap: Hammam Mubarak\nKelas: XI RPL',
          style: TextStyle(
            fontSize: 30,
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}