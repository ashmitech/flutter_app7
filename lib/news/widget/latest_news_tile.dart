import 'package:flutter/material.dart';

class NewsItemTile extends StatefulWidget {

  final String imageUrl;
  final String title;
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
  State<NewsItemTile> createState() => _NewsItemTileState();
}

class _NewsItemTileState extends State<NewsItemTile> {
  bool click= false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // News Image
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(widget.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          NewsItemTile._tileHorizontalSpacing,
          // News Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                NewsItemTile._tileVerticalSpacing,
                Text(
                  widget.time,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: (){
                setState(() {
                  
                });
              },
              child: 
            Icon((click=!click)?
            Icons.bookmark_border_outlined
            :Icons.bookmark,color: Colors.amber,),
            ),
          ),
        ],
      ),
    );
  }
}