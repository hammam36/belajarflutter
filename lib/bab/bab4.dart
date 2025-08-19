import 'package:flutter/material.dart';

class BabEmpat extends StatefulWidget {
  const BabEmpat({Key? key}) : super(key: key);

  @override
  State<BabEmpat> createState() => _BabEmpatState();
}

class _BabEmpatState extends State<BabEmpat> {
  final TextEditingController _SatuController = TextEditingController();
  final TextEditingController _DuaController = TextEditingController();
  String _hasil = '';

  void _calculate(String operasi) {
    final satu = _SatuController.text;
    final dua = _DuaController.text;

    final double? angkaSatu = double.tryParse(satu);
    final double? angkaDua = double.tryParse(dua);

    double hasil = 0;
    String error = '';

    switch (operasi) {
      case '+':
        hasil = angkaSatu! + angkaDua!;
        break;
      case '-':
        hasil = angkaSatu! - angkaDua!;
        break;
      case '*':
        hasil = angkaSatu! * angkaDua!;
        break;
      case '/':
        if (angkaDua == 0 || angkaSatu == 0) {
          error = 'Error, g bisa dibagi 0';
        } else {
          hasil = angkaSatu! / angkaDua!;
        }
        hasil = angkaSatu! / angkaDua!;
        break;
      default:
        error = 'Operasi tidak valid';
    }
    setState(() {
      _hasil = error.isNotEmpty ? error : '$hasil';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Bab Empat - Calculator'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: EdgeInsetsGeometry.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _SatuController,
                  decoration: InputDecoration(
                    labelText: 'Masukkan Angka Pertama...',
                  ),
                ),
                SizedBox(height: 50),
                TextField(
                  controller: _DuaController,
                  decoration: InputDecoration(
                    labelText: 'Masukkan Angka Kedua...',
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _calculate('+'),
                      child: Text('+'),
                    ),
                    SizedBox(width: 50),
                    ElevatedButton(
                      onPressed: () => _calculate('-'),
                      child: Text('-'),
                    ),
                    SizedBox(width: 50),
                    ElevatedButton(
                      onPressed: () => _calculate('*'),
                      child: Text('x'),
                    ),
                    SizedBox(width: 50),
                    ElevatedButton(
                      onPressed: () => _calculate('/'),
                      child: Text(':'),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      _hasil,
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
