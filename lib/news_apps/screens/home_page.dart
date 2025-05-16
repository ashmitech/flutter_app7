import 'package:flutter/material.dart';
import 'package:my_app/widgets/dropdown_widget.dart' show MyDropdown;
import 'package:my_app/news_apps/screens/main_home_page.dart';
import 'package:my_app/news_apps/screens/search_page.dart';
import 'package:my_app/news_apps/screens/bookmark_page.dart';
import 'package:my_app/news_apps/screens/settings_page.dart';

import 'navigation/custom_bottom_nav.dart' show CustomBottomNav;

class NewsHomePage extends StatefulWidget {
  const NewsHomePage({super.key});
  @override
  State<StatefulWidget> createState() => _NewsHomePageState();
}

class _NewsHomePageState extends State<NewsHomePage> {
  int _selectedIndex = 0;

  List<int> bookmarkedItems = [];
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      MainHomePage(),
      SearchPage(),
      BookmarkPage(
        bookmarkedItems: bookmarkedItems,
      ), 
      SettingsPage(),
    ];
  }

  // Function to handle bottom navigation tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(25, 118, 210, 1),
        title: Text("News Apps Demo", 
        style: TextStyle(color: Colors.white,
         fontWeight: FontWeight.bold)),
        centerTitle: false,
        actions: [
          Padding(padding: EdgeInsets.fromLTRB(0, 0, 18.0, 0), 
          child: 
          InkWell(onTap: () => MyDropdown(),
          child: Icon(Icons.menu, color: Colors.white70,),)
          )
        ],
      ),

      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      // Display selected page
      body: _pages[_selectedIndex],
    );
  }
}

