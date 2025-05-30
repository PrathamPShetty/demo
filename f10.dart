import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp()); // Starting point
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animated Logo',
      home: AnimatedLogoScreen(),
    );
  }
}

class AnimatedLogoScreen extends StatefulWidget {
  @override
  _AnimatedLogoScreenState createState() => _AnimatedLogoScreenState();
}

class _AnimatedLogoScreenState extends State<AnimatedLogoScreen> {
  double _size = 100.0;
  Color _color = Colors.blue;

  void _changeProperties() {
    final random = Random();
    setState(() {
      _size = random.nextDouble() * 200 + 50;
      _color = Color(random.nextInt(0xFFFFFF)).withOpacity(1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Logo')),
      body: Center(
        child: GestureDetector(
          onTap: _changeProperties,
          child: AnimatedContainer(
            width: _size,
            height: _size,
            color: _color,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}
