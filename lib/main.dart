// ...............

import 'package:flutter/material.dart';
import 'package:flutter_test_2/bab/bab3.dart';
import 'package:flutter_test_2/bab/bab4.dart';
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
      initialRoute: 'bab3',
      routes: {
        'bab2': (context) => const MyBiodata(),
        'bab3': (context) => const Babdua(),
        'bab4': (context) => const Babempat(),
      },
    );
  }
}