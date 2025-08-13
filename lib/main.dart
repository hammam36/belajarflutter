// ...............

import 'package:flutter/material.dart';
import 'package:flutter_test_2/bab/bab2.dart';
import 'package:flutter_test_2/bab/bab3.dart';
import 'bab/bab1.dart';
// import 'pages/login_page.dart';
// import 'pages/account_page.dart';
// import 'pages/cart_page.dart';
// import 'pages/home_page.dart';
// import 'pages/list_chat.dart';
// import 'pages/detail_chat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'bab1',
      routes: {
        'bab1': (context) => const LoginPage(),
        'bab2': (context) => const Babdua(),
        'bab3': (context) => const BabTiga(),
      },
    );
  }
}