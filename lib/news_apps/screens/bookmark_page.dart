import 'package:flutter/material.dart';

class BookmarkPage extends StatelessWidget {
  final List<int> bookmarkedItems;

  const BookmarkPage({super.key, required this.bookmarkedItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      AppBar(
        // title: Text("Bookmarked Items")
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        centerTitle:false,
        title:Text("Bookmarks", 
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
        ),
        actions:
         <Widget>[
          IconButton(
            icon: const Icon(Icons.bookmark),
            tooltip: 'Edit Bookmark',
            onPressed: () {
              // handle the press
            },
          ),
        ],
        ),
      body:
          bookmarkedItems.isEmpty
              ? Center(child: Text("No Bookmarked Items"))
              : ListView.builder(
                itemCount: bookmarkedItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Item ${bookmarkedItems[index]}"),
                  );
                },
              ),
    );
  }
}
