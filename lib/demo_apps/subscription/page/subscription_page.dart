import 'package:flutter/material.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        centerTitle:false,
        title:Text("Subscription", 
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
        ),
        actions:
         <Widget>[
          IconButton(
            icon: const Icon(Icons.newspaper),
            tooltip: 'My Subscription',
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      body: Center(
      child: Text(" Subscription Page",
       style: TextStyle(fontSize: 24)
       ),
    ),
    );
    
  }
}