import 'package:flutter/material.dart';

class BabEnam extends StatelessWidget {
  const BabEnam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bab Enam - Gallery App'), centerTitle: true),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, 'gallery'),
          child: Text('Gallery App'),
        ),
      ),
    );
  }
}

class Photo {
  final String title;
  final String image;

  Photo({required this.title, required this.image});
}

class PhotoList extends StatelessWidget {
  final List<Photo> photos = [
    Photo(
      title: 'Chair',
      image:
          'https://images.unsplash.com/photo-1755417146804-dd5bb2b66a34?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Photo(
      title: 'Car',
      image:
          'https://images.unsplash.com/photo-1755095675087-81f1ece2f0e0?q=80&w=688&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Photo(
      title: 'Happy Birtday to me',
      image:
          'https://images.unsplash.com/photo-1729701163957-85ba5dc5b971?q=80&w=685&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Photo(
      title: 'Elephant',
      image:
          'https://images.unsplash.com/photo-1741850821596-f29a6e58356b?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
  ];

  PhotoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bab Enam - Gallery'), centerTitle: true),
      body: Center(
        child: Card(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 500,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            padding: EdgeInsets.all(8.0),
            itemCount: photos.length,
            itemBuilder: (context, index) {
              final photo = photos[index];
              return Card(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'detailphoto', arguments: photo);
                    print('Photo ${photo.title} diketuk!');
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Image.network(
                          photo.image, 
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text('${photo.title}'),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class PhotoDetailScreen extends StatelessWidget {
  final Photo photo;

  const PhotoDetailScreen({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bab Enam - Photo Detail'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text('${photo.title}', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
            Image.network(
              photo.image,
              fit: BoxFit.cover,
              height: 700,
            ),
          ],
        ),
      ),
    );
  }
}
