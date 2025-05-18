import 'package:flutter/material.dart';
import 'package:my_app/demo_apps/form/page/login_form_page.dart';
import 'package:my_app/demo_apps/profile/page/profile_page.dart' show ProfilePage;
import 'package:my_app/news_apps/screens/main_home_page.dart'show MainHomePage;
import 'package:my_app/news_apps/screens/search_page.dart' show SearchPage;
import 'package:my_app/news_apps/screens/bookmark_page.dart' show BookmarkPage;
import 'package:my_app/news_apps/screens/settings_page.dart' show SettingsPage;
import 'package:my_app/news_apps/widgets/menu_button_widget.dart' show MenuButtonWidget; // appbar 

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
      break;
      case 'logout':
      _showLogoutDialog(context);
      break;
    }
  }
  void _showLogoutDialog(BuildContext context){
    showDialog(context: context,
    builder: (BuildContext context){
      return AlertDialog(
        title: Text("Conform Logout"),
        content: Text("Are you sure you waht to log out"),
        actions: [
          TextButton(
            onPressed:(){
              Navigator.of(context).pop(); // close the dialog
            }, 
            child: Text("Cancel"),
          ),
          TextButton(onPressed: (){
            Navigator.of(context).pop(); //close the dialog

            Navigator.push(
        context, 
        MaterialPageRoute(builder: (_)=>LoginFormPage()),
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You have successfully Logged out. Please login again to continue"), backgroundColor: Colors.green,),
        // TODO:
        //to display message are you sure you want to logout when user press on logout menu
        //if user press yes logout the screen with message on snack bar successfully logout.
        // if user press no, continue to the same screen.
      );
          }, child: Text("Logout"),
          ),
        ],
      );
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

