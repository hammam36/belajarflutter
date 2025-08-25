import 'package:flutter/material.dart';

class Calc extends StatelessWidget {
  const Calc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kalkulator Simpel')),
      body: const KalkulatorWidget(),
    );
  }
}

class KalkulatorWidget extends StatefulWidget {
  const KalkulatorWidget({super.key});

  @override
  State<KalkulatorWidget> createState() => _KalkulatorWidgetState();
}

class _KalkulatorWidgetState extends State<KalkulatorWidget> {
  final TextEditingController angka1 = TextEditingController();
  final TextEditingController angka2 = TextEditingController();
  String hasil = '';

  void hitung(String operasi) {
    final a = double.tryParse(angka1.text) ?? 0;
    final b = double.tryParse(angka2.text) ?? 0;

    setState(() {
      switch (operasi) {
        case '+':
          hasil = '${a + b}';
          break;
        case '-':
          hasil = '${a - b}';
          break;
        case '*':
          hasil = '${a * b}';
          break;
        case '/':
          hasil = b == 0 ? '❌ Tidak bisa dibagi nol' : '${a / b}';
          break;
        default:
          hasil = 'Operasi tidak dikenal';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: angka1,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Angka 1'),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: angka2,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Angka 2'),
          ),
          const SizedBox(height: 20),
          Text('Hasil: $hasil', style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            children: [
              ElevatedButton(onPressed: () => hitung('+'), child: const Text('+')),
              ElevatedButton(onPressed: () => hitung('-'), child: const Text('-')),
              ElevatedButton(onPressed: () => hitung('*'), child: const Text('×')),
              ElevatedButton(onPressed: () => hitung('/'), child: const Text('÷')),
            ],
          ),
        ],
      ),
    );
  }
}
