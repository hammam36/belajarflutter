import 'package:flutter/material.dart';

class Belajar extends StatelessWidget {
  const Belajar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo EdgeInsets & Tombol')),
      body: Padding(
        padding: const EdgeInsets.all(16), // Padding luar seluruh body
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('🔹 EdgeInsets.all(20)', style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.blue.shade100,
              child: const Text('Padding seragam di semua sisi'),
            ),
            const SizedBox(height: 20),

            const Text('🔹 EdgeInsets.symmetric(horizontal: 30, vertical: 10)', style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              color: Colors.green.shade100,
              child: const Text('Padding horizontal & vertical'),
            ),
            const SizedBox(height: 20),

            const Text('🔹 EdgeInsets.only(left: 40, top: 10)', style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
              padding: const EdgeInsets.only(left: 40, top: 10),
              color: Colors.orange.shade100,
              child: const Text('Padding sisi tertentu'),
            ),
            const SizedBox(height: 30),

            const Text('🧪 Tombol Beragam:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Default'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text('Lebar & Warna'),
                ),
                SizedBox(
                  width: 120,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('SizedBox'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Custom Style', style: TextStyle(color: Colors.white)),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.thumb_up),
                  label: const Text('Dengan Ikon'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
