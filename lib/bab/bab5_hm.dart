import 'package:flutter/material.dart';

// Halaman daftar produk
class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key});

  final List<Map<String, dynamic>> products = [
    {
      "name": "Laptop",
      "price": 12000000,
      "desc": "Laptop gaming keren",
      "imageUrl": "https://dummyimage.com/155"
    },
    {
      "name": "HP",
      "price": 4500000,
      "desc": "Smartphone kamera bagus",
      "imageUrl": "https://dummyimage.com/150"
    },
    {
      "name": "Headphone",
      "price": 750000,
      "desc": "Suara mantap",
      "imageUrl": "https://dummyimage.com/250"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Produk")),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final p = products[index];
          return ListTile(
            leading: Image.network(p["imageUrl"]), // tampil di list juga
            title: Text(p["name"]),
            subtitle: Text("Rp ${p["price"]}"),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/detail',
                arguments: p, // kirim semua data termasuk imageUrl
              );
            },
          );
        },
      ),
    );
  }
}

// Halaman detail produk
class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> product =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(title: Text(product["name"])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(product["imageUrl"], height: 150),
            ),
            const SizedBox(height: 16),
            Text(product["name"], style: const TextStyle(fontSize: 24)),
            Text("Rp ${product["price"]}", style: const TextStyle(color: Colors.green, fontSize: 20)),
            const SizedBox(height: 10),
            Text(product["desc"]),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Kembali"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
