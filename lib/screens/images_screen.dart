import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:pract3/theme/app_theme.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({super.key});

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Foto Hasbulla'),
      ),
      body: ListView(
        children: [ 
          cardImage1(),
          imageFade(),
        ],
      ),
    );
  }
  Card cardImage1() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.all(15),
      elevation: 30,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Column(
        children: [
          const  Image(
              image: AssetImage('assets/img/foto1.jpg'),
              ),
          
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                'hasbullita y mascota',
                style: AppTheme.lightTheme.textTheme.headlineMedium,
              ),
            ),
        ],
        ),
      ),
    );
  }

  SizedBox image2(){
    return SizedBox(
      height: 450.0,
      width: 450.0,
      child: Image.network('https://i.pinimg.com/1200x/2b/6c/78/2b6c7874e57c38253c4f5d94f6d65e1d.jpg'),
      );
  }

  Stack imageFade(){
    return Stack(
      children: <Widget>[
        const Center(
          child: CircularProgressIndicator(),
        ),
        Center(
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage, 
            image: 'https://i.pinimg.com/1200x/2b/6c/78/2b6c7874e57c38253c4f5d94f6d65e1d.jpg'),
        ),

      ],
    );

  }
}