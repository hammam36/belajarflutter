// membuat fungsi utama halaman bab2.dart
import 'package:flutter/material.dart';

class Babdua extends StatelessWidget {
  const Babdua({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bab Dua'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Rainadiz Danendra Nugroho', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
            Text('XI RPL Genksss'),
          ],
        ),
      ),
    );
  }
}