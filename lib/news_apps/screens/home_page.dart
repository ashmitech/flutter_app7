import 'package:flutter/material.dart';
import 'package:my_app/demo_apps/profile/page/profile_page.dart';
import 'package:my_app/news_apps/screens/main_home_page.dart';
import 'package:my_app/news_apps/screens/search_page.dart';
import 'package:my_app/news_apps/screens/bookmark_page.dart';
import 'package:my_app/news_apps/screens/settings_page.dart';
import 'package:my_app/news_apps/widgets/menu_button_widget.dart'; // appbar 

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
  // function to handle the navigation menu
  void _onMenuSelected(BuildContext context, String value){
    switch (value){
      case 'profile':
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_)=> ProfilePage()),
      );
      case 'logout':
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Logged out")),
        // TODO:
        //to display message are you sure you want to logout when user press on logout menu
        //if user press yes logout the screen with message on snack bar successfully logout.
        // if user press no, continue to the same screen.
      );
      break;
    }
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
          child: MenuButtonWidget(
            onSelected: (value) => _onMenuSelected(context, value))
          ),
        ],
      ),
      // center build welcome to news application
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      // Display selected page
      body: _pages[_selectedIndex],
    );
  }
}

