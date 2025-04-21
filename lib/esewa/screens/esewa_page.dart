import 'package:flutter/material.dart';

class EsewaPage extends StatelessWidget {
  const EsewaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('eSewa Payment'),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold),  
        leading: Icon(Icons.arrow_back),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Esewa Payment'),
      ),
    );
  }
}