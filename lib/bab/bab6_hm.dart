import 'package:flutter/material.dart';

// Data dummy foto
final List<Map<String, String>> photos = [
  {
    'title': 'Pegunungan',
    'url': 'https://picsum.photos/id/10/200/300',
  },
  {
    'title': 'Kota Malam',
    'url': 'https://picsum.photos/id/20/200/300',
  },
  {
    'title': 'Hutan Kabut',
    'url': 'https://picsum.photos/id/30/200/300',
  },
  {
    'title': 'Pantai Indah',
    'url': 'https://picsum.photos/id/40/200/300',
  },
  {
    'title': 'Danau Sunyi',
    'url': 'https://picsum.photos/id/50/200/300',
  },
];

// Halaman utama: gallery grid
class PhotoGridScreen extends StatelessWidget {
  const PhotoGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Foto")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // jumlah kolom per baris (bisa 2/3)
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.7, // biar proporsi lebih enak
          ),
          itemCount: photos.length,
          itemBuilder: (context, index) {
            final photo = photos[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/photoDetail',
                  arguments: photo,
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        photo['url']!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    photo['title']!,
                    style: const TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// Halaman detail foto
class PhotoDetail extends StatelessWidget {
  const PhotoDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> photo =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(title: Text(photo['title']!)),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.network(photo['url']!),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              photo['title']!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Kembali"),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
