import 'package:flutter/material.dart';
import 'package:my_app/demo_apps/form/page/login_form_page.dart';
import 'package:my_app/demo_apps/profile/page/profile_page.dart' show ProfilePage;
import 'package:my_app/news_apps/screens/main_home_page.dart'show MainHomePage;
import 'package:my_app/news_apps/screens/search_page.dart' show SearchPage;
import 'package:my_app/news_apps/screens/bookmark_page.dart' show BookmarkPage;
import 'package:my_app/news_apps/screens/settings_page.dart' show SettingsPage;
import 'package:my_app/news_apps/widgets/menu_button_widget.dart' show MenuButtonWidget; 

// appbar 
import 'navigation/custom_bottom_nav.dart' show CustomBottomNav;

/*esewa flutter sdk */
import 'package:esewa_flutter/esewa_flutter.dart' show EsewaPayButton, EsewaPaymentResponse;
import 'package:esewa_flutter_sdk/esewa_config.dart' show EsewaConfig;

/**ESewa function import*/
import 'package:my_app/function/esewa.dart';


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
  /* function to display message are you sure you want to logout when user press on logout menu*/
        
  void _showLogoutDialog(BuildContext context){
    showDialog(context: context,
    builder: (BuildContext context){
      return AlertDialog(
        //title
        title: Text("Conform Logout?"),
        //content description
        content: Text("This will close your application. You'll need to re-login."),
        //background color
        backgroundColor: Colors.blue.shade50,
        //elevation
        elevation: 8.0,
        //actions 
        actions: [
          TextButton(
            onPressed:(){
              Navigator.of(context).pop(); 
              // close the dialog and continue to the same page
            }, 
            child: Text("Cancel", style: TextStyle(color: Colors.red.shade300),),
          ),
          TextButton(onPressed: (){
            Navigator.of(context).pop(); 
            // close the dialog with navigation to home page with a scaffold message
            Navigator.push(
            context, 
            MaterialPageRoute(builder: (_)=>LoginFormPage()),
      );

      /*if user press yes logout the screen with message on snack bar successfully logout else continue to the same screen.*/

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('You have successfully Logged out. Please re-login to continue.'), 
          backgroundColor: Colors.orange,
        ),
        );
      }, child: Text("Ok"),
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
        title: Text("News Apps", 
        style: TextStyle(color: Colors.white70,
         fontWeight: FontWeight.bold)),
        centerTitle: false,
        leading: 
        Image.asset('assets/images/news_logo.jpeg',
        height:100.0),
        actions: [
          
          Padding(padding: EdgeInsets.fromLTRB(0, 0, 18.0, 0), 
          child: 
          Row(children: [
            Row(
              children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(8.0),
                    child:
                  Text(
                    "Hello, Reader!", 
                    style: TextStyle(
                      color: Colors.white70),
                    ), 
                  ),
                ],
              ),
              SizedBox(width: 5.0,),
              // profile section
              MenuButtonWidget(
                onSelected: (value) => _onMenuSelected(context, value)
             )
            ],
            ),
          ],)
          ),
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

/* TODO:
// make esewa subscription button inside the subscription of the profile page.
// in place of esewa button write test as logged in as username*/
