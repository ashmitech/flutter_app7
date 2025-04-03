import 'package:flutter/material.dart';

class SportsNewsPage extends StatelessWidget {
  const SportsNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade800,
        foregroundColor: Colors.white,
        title: Text("S P O R T S  N E W S"),
      ),
        
      body: Center(
        child: Text('Sports News Here...'),
      ),
    );
  }
}