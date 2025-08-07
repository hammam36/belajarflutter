// membuat fungsi utama halaman bab2.dart
import 'package:flutter/material.dart';

class Babdua extends StatelessWidget {
  const Babdua({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ini Bab 2'),
      ),
      body: Center(
        child: Text('Bab 2'),
      ),
    );
  }
}