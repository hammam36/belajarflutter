import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BabTiga extends StatelessWidget {
  const BabTiga({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Bab Tiga'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/foto_profil.jpg'),
                ),
                SizedBox(height: 20,),
                Text('Rainadiz Danendra Nugroho'),
                SizedBox(height: 10,),
                Text('Software Engineer'),
                SizedBox(height: 20,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FaIcon(FontAwesomeIcons.instagram),
                    FaIcon(FontAwesomeIcons.linkedin),
                    FaIcon(FontAwesomeIcons.github),
                  ]
                )
              ],
            ),
          ),
        ),
        ),
    );
  }
}