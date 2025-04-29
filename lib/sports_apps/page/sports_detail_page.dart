import 'package:flutter/material.dart';
// import 'package:my_app/sport/widget/sport_widget.dart';

class SportsDetailPage extends StatelessWidget {
  const SportsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text("Sports Details Page"),
        actions: [
          Icon(Icons.notifications), 
          CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage("assets/image/profile.jpg"),
          ),
        ],
      ),
      body: ListView(
        children: [
          Row(children: [
            Text("Test Title "),
            Text("Author name"),
            Text("Followers"),
            Text("Auther Photo"),
          ],),
          Row(children: [Text("Data Description")],),
          Row(children:[Text("Bullet List")],),
          
        ],
      ),
    );
  }
}