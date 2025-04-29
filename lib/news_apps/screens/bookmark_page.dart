import 'package:flutter/material.dart';

class BookmarkPage extends StatelessWidget {
  final List<int> bookmarkedItems;

  const BookmarkPage({super.key, required this.bookmarkedItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bookmarked Items")),
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
