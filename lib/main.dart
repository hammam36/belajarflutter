// ...............

import 'package:flutter/material.dart';
import 'package:belajar_flutter/bab/bab3.dart';
import 'package:belajar_flutter/bab/bab4.dart';
import 'bab/bab2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'bab4',
      routes: {
        'bab2': (context) => const MyBiodata(),
        'bab3': (context) => const Babdua(),
        'bab4': (context) => const Babempat(),
      },
    );
  }
}