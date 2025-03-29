import 'package:flutter/material.dart';

class NewsAppBarWidget extends StatelessWidget {
  // You might want to pass the screen padding as a parameter
  final EdgeInsets screenPadding;

  const NewsAppBarWidget({super.key, required this.screenPadding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: screenPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/images/news_logo.jpeg",
            height: 50,
            width: 100,
          ),
          // You might want to add the search icon back in the separated widget
          // const Icon(Icons.search, size: 30),
        ],
      ),
    );
  }
}