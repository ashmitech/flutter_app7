import 'package:flutter/material.dart';
import 'package:my_app/demo_apps/form/page/login_form_page.dart' show LoginFormPage;
import 'package:my_app/demo_apps/profile/page/profile_page.dart' show ProfilePage;
import 'package:my_app/news_apps/screens/main_home_page.dart'show MainHomePage;
import 'package:my_app/news_apps/screens/search_page.dart' show SearchPage;
import 'package:my_app/news_apps/screens/bookmark_page.dart' show BookmarkPage;
import 'package:my_app/news_apps/screens/settings_page.dart' show SettingsPage;
import 'package:my_app/news_apps/widgets/menu_button_widget.dart' show MenuButtonWidget; 

// appbar 
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

  // function to conform logout from user      
  void _showLogoutDialog(BuildContext context){
    showDialog(context: context,
    builder: (BuildContext context){
      return AlertDialog(
        // title
        title: Text("Conform Logout?",),
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

            child: Text("Cancel", style: TextStyle(color: Colors.red.shade300, decoration: TextDecoration.underline, decorationColor: Colors.red.shade300),),
          ),
          TextButton(
            
            onPressed: (){
            Navigator.of(context).pop(); 
            // close the dialog with navigation to home page with a scaffold message
            Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginFormPage()));

             ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('You have successfully Logged out. Please re-login to continue.'), 
                backgroundColor: Colors.red.shade300,
              ),
              );
            },
            child: Text("Ok", style: TextStyle(color:Colors.black87, decoration: TextDecoration.underline),),

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
        title: Text(
          "Breaking News", 
        style: TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.bold
          )),
        centerTitle: false,
        leading: IconButton(
          onPressed: (){
            // show side navigation bar 
          }, 
          icon: Icon(
            Icons.menu,
            color: Colors.white,
            ),),
        
        actions: [
          
          Padding(padding: EdgeInsets.fromLTRB(0, 0, 18.0, 0), 
          child: 
          Row(children: [
            Row(
              children: [
                Container(margin: EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 0.0),),
                        Image.asset('assets/images/news_logo.jpeg', height:20.0),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(8.0),
                    child:
                    Row(
                      children:[
                        Text(
                        "Hello, Reader!", 
                        style: TextStyle(
                          color: Colors.white70),
                        ), 
                      ] 
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

// TODO:
  // make esewa subscription button inside the subscription of the profile page or alert dialog box subscription after some time of reading.
  // in place of profile picture show login when user is not logged in, show profile picture if user is logged in
