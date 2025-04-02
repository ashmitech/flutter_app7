import 'package:flutter/material.dart';

class NewsAppBarWidget extends StatelessWidget {

const  NewsAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/images/news_logo.jpeg",
            height: 50,
            width: 100,
          ),
          // You might want to add the search icon back in the separated widget
          const Icon(Icons.menu, size: 30),
        ],
      ),
    );
  }
}