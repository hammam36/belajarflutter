import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class Babtiga extends StatelessWidget {
  const Babtiga({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Saya')),
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 19, 221, 59),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(255, 55, 55, 0.298),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Foto Profil (dari URL)
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images.jpg'),
              ),

              const SizedBox(height: 16),

              // Nama Lengkap
              Text(
                'Hammam Mubarak',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              // Profesi/Pekerjaan
              Text(
                'Flutter Developer at IDN',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 24),

              // Ikon Media Sosial (Row)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook, color: Colors.blue),
                  const SizedBox(width: 20),
                  Icon(FontAwesomeIcons.instagram, color: Colors.pink),
                  const SizedBox(width: 20),
                  Icon(FontAwesomeIcons.github, color: Colors.black),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
