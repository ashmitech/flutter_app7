import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      AppBar(
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        centerTitle:false,
        title:Text("Edit Profile", 
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
        ),
        actions:
         <Widget>[
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            tooltip: 'Edit Profile',
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      body:
      Center(child: 
        Row(
          children: [
            Text("Edit Profile Form Page"),
          ],
        )
        )
    );
  
  }
}