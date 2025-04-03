import 'package:flutter/material.dart';

class BusinesNewsPage extends StatelessWidget {
  const BusinesNewsPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade800,
        foregroundColor: Colors.white,
        title: Text("B U S I N E S S   N E W S"),
      ),
        
      body: Center(
        child: Text('Business News Here ...'),
      ),
    );
  }
}