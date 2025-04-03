import 'package:flutter/material.dart';

class AllNewsPage extends StatelessWidget {
  const AllNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade800,
        foregroundColor: Colors.white,
        title: Text("A L L  N E W S"),
      ),
        
      body: Center(
        child: Text('All News Here...'),
      ),
    );
  }
}