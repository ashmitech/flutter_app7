import 'package:flutter/material.dart';

class NewsItemTile extends StatelessWidget {
  /// The URL of the image for this news item.
  final String imageUrl;

  /// The title of this news item.
  final String title;

  /// The time elapsed since this news item was published.
  final String time;

  static const SizedBox _tileHorizontalSpacing = SizedBox(width: 16); // news tile horizontal padding
  static const SizedBox _tileVerticalSpacing = SizedBox(height: 8);  
  

  const NewsItemTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          // News Image
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          _tileHorizontalSpacing,
          // News Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _tileVerticalSpacing,
                Text(
                  time,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}