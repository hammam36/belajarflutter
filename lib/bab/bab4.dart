// bab4.dart
import 'package:flutter/material.dart';

class Babempat extends StatelessWidget {
  const Babempat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kalkulator')),
      body: const CalculatorWidget(),
    );
  }
}

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({Key? key}) : super(key: key);

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String _hasil = 'Hasil';

  void _hitung(String op) {
    setState(() {
      final a = double.tryParse(_controller1.text) ?? 0.0;
      final b = double.tryParse(_controller2.text) ?? 0.0;

      if (op == '/' && b == 0) {
        _hasil = '❌ Tidak bisa dibagi nol';
        return;
      }

      _hasil = switch (op) {
        '+' => '${a + b}',
        '-' => '${a - b}',
        '*' => '${a * b}',
        '/' => '${a / b}',
        _ => 'Operasi tidak dikenal',
      };
    });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _controller1,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Angka pertama',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller2,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Angka kedua',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          Text('Hasil: $_hasil', style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            children: [
              ElevatedButton(onPressed: () => _hitung('+'), child: const Text('+')),
              ElevatedButton(onPressed: () => _hitung('-'), child: const Text('−')),
              ElevatedButton(onPressed: () => _hitung('*'), child: const Text('×')),
              ElevatedButton(onPressed: () => _hitung('/'), child: const Text('÷')),
            ],
          ),
        ],
      ),
    );
  }
}