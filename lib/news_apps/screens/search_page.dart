import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchQuery = "";
  final TextEditingController _searchController = TextEditingController();

  final List<String> _items = [
    "Politics News",
    "Economics News",
    "Social News",
    "Technology News",
    "Environmental News",
    "Legal News",
    "Environemntal News",
    "Global News",
    "Sports News",
    "Health News",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Page"),
       backgroundColor: Colors.blue[700]),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Search Here",
                prefixIcon: Icon(Icons.search),
                suffixIcon:
                    _searchQuery.isNotEmpty
                        ? IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            setState(() {
                              _searchQuery = "";
                              _searchController.clear();
                            });
                          },
                        )
                        : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children:
                  _items
                      .where(
                        (item) => item.toLowerCase().contains(
                          _searchQuery.toLowerCase(),
                        ),
                      )
                      .map((item) => ListTile(title: Text(item)))
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
