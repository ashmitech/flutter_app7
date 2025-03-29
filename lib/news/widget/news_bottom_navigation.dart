// Builds the bottom navigation bar.
  import 'package:flutter/material.dart';  

class NewsBottomNavigation extends StatelessWidget {
  const NewsBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.home, color:Color.fromARGB(255, 178, 18, 7), size: 30),
          Icon(Icons.bookmark_border, color: Colors.grey, size: 30),
          Icon(Icons.search, color: Colors.grey, size: 30),
          Icon(Icons.person_outline, color: Colors.grey, size: 30),
        ],
      ),
    );
  }
}
  
 