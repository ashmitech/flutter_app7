import 'package:flutter/material.dart';

import 'package:my_app/news/screens/main_home_page.dart';
import 'package:my_app/news/screens/search_page.dart';
import 'package:my_app/news/screens/bookmark_page.dart';
import 'package:my_app/news/screens/settings_page.dart';

import 'navigation/custom_bottom_nav.dart' show CustomBottomNav;

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      ), // Now accessed inside initState
      SettingsPage(),
    ];
  }

  // Function to handle bottom navigation tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text("News Application", 
        style: TextStyle(color: Colors.white,
         fontWeight: FontWeight.bold)),
        centerTitle: true,
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

//The issue is that you are trying to initialize _pages with bookmarkedItems, but bookmarkedItems is an instance variable, and instance variables cannot be accessed directly during initialization.