import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Model Photo
class Photo {
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}

// Screen Utama
class PhotoList extends StatelessWidget {
  const PhotoList({super.key});

  Future<List<Photo>> fetchPhotos() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200) {
      List jsonData = jsonDecode(response.body);
      return jsonData.map((e) => Photo.fromJson(e)).toList();
    } else {
      throw Exception('Gagal mengambil data dari API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Photo Viewer App")),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text("Terjadi kesalahan: ${snapshot.error.toString()}"));
          } else if (snapshot.hasData) {
            final photos = snapshot.data!;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 kolom
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.8,
              ),
              padding: const EdgeInsets.all(8),
              itemCount: 20, // biar tidak terlalu banyak (API ada 5000)
              itemBuilder: (context, index) {
                final photo = photos[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PhotoDetailScreen(photo: photo),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.network(
                            photo.thumbnailUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            photo.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("Tidak ada data"));
          }
        },
      ),
    );
  }
}

// Detail Screen
class PhotoDetailScreen extends StatelessWidget {
  final Photo photo;

  const PhotoDetailScreen({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Foto")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(photo.url),
            const SizedBox(height: 16),
            Text(
              photo.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text("Kembali"),
            )
          ],
        ),
      ),
    );
  }
}
