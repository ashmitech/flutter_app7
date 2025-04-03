import 'package:flutter/material.dart';

class AllNewsPage extends StatelessWidget {
  const AllNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade800,
        foregroundColor: Colors.white,
        title: Text("Y O U R   B O O K M A R K S"),
      ),
        
      body: Center(
        child: Text('All Bookmarked News Here...'),
      ),
    );
  }
}