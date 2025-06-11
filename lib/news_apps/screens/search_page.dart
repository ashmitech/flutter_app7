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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      AppBar(
        // title: Text("Bookmarked Items")
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        centerTitle:false,
        title:Text("Search", 
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
        ),
        actions:
         <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search Information',
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
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
