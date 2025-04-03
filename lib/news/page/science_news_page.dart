import 'package:flutter/material.dart';

class ScienceNewsPage extends StatelessWidget {
  const ScienceNewsPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade800,
        foregroundColor: Colors.white,
        title: Text("S C I E N C E   N E W S"),
      ),
        
      body: Center(
        child: Text('Science News Here ...'),
      ),
    );
  }
}