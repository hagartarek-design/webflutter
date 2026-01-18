
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack & Positioned Example',
      home: Scaffold(
        appBar: AppBar(title: Text('Figma to Flutter')),
        body: Center(
          child: BannerWithOverlay(),
        ),
      ),
    );
  }
}

class BannerWithOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 250,
          child: Image.network(
            'https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/assets/banner.png',
            fit: BoxFit.cover,
          ),
        ),

        Positioned(
          top: 16,
          right: 16,
          child: CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/assets/profile.jpg'),
          ),
        ),

        Positioned(
          bottom: 16,
          left: 16,
          child: Text(
            'Welcome, Hager!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
