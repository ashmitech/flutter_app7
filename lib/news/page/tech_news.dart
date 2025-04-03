import 'package:flutter/material.dart';

class TechNewsPage extends StatelessWidget {
  const TechNewsPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade800,
        foregroundColor: Colors.white,
        title: Text("T E C H   N E W S"),
      ),
        
      body: Center(
        child: Text('Tech News Here ...'),
      ),
    );
  }
}