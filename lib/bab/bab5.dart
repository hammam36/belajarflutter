import 'package:flutter/material.dart';

class BabLima extends StatelessWidget {
  const BabLima({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bab Lima - Product Catalog'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          child: TextButton(
            child: Text('Product List'),
            onPressed: () {
              Navigator.pushNamed(context, 'product');
            },
          ),
        ),
      ),
    );
  }
}

class Product {
  final String nama;
  final double harga;

  Product({required this.nama, required this.harga});
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(nama: 'Sabun', harga: 15000),
    Product(nama: 'Susu', harga: 70000),
    Product(nama: 'Teh', harga: 3000),
  ];

  ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bab Lima - Product List'), centerTitle: true),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Padding(
            padding: EdgeInsets.all(15),
            child: Card(
              child: ListTile(
                title: Text(product.nama),
                subtitle: Text('Rp ${product.harga.toString()}'),
                onTap: () {
                  Navigator.pushNamed(context, 'detail', arguments: product);
                  print('Item ${product.nama} diketuk!');
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bab Lima - Product Detail'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text('Nama Produk: ${this.product.nama}', style: TextStyle(fontSize: 100),),
            Text('Harga Produk: ${this.product.harga.toString()}', style: TextStyle(fontSize: 100)),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Kembali'),
            )
          ],
        ),
      ),
    );
  }
}
