import 'package:flutter/material.dart';
import 'package:my_app/demo_apps/form/page/login_form_page.dart';
// import 'package:my_app/demo_apps/home/page/home_page.dart';
import 'package:my_app/demo_apps/profile/widget/profile_widget.dart' show ProfileWidget;
import 'package:my_app/demo_apps/profile/page/edit_profile_page.dart' show EditProfilePage;

// ignore: unused_import
import 'package:my_app/news_apps/screens/bookmark_page.dart'show BookmarkPage;
import 'package:my_app/news_apps/screens/home_page.dart';
// ignore: unused_import
import 'package:my_app/news_apps/widgets/menu_button_widget.dart';
// import 'package:path/path.dart';


class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final List<Map> profileData =[
    {"title":"Bookmark",
     "icon":Icon(Icons.bookmark_outline),
     "method":null,
    },
    {"title":"Settings", "icon":Icon(Icons.settings)}, 
    {"title":"Log Out",
     "icon":Icon(Icons.logout_rounded,),
     "method":LogoutButtonWidget}, // logout button in the profile page change this color to red
  ];

  // function to handle the navigation menu
  void _onMenuSelected(BuildContext context, String value){
    switch (value){
      case 'subscribe':
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_)=>NewsHomePage()
            // var esewaApp = EsewaApp(
            // title: 'Subscribe',);
            // return esewaApp;
          
            ),
      );
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

  // function to show logout dialog box
  void _showLogoutDialog(BuildContext context){
    showDialog(context: context,
    builder: (BuildContext context){
      return 
      AlertDialog(
        title: Text("Conform Logout", 
        ),
        content: Text("Are you sure you want to logout?"),
        
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
          }, child: Text("Yes"),
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
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        centerTitle: false,
        title: Text("My Profile",
        textAlign: TextAlign.left,
         style:TextStyle(
          fontWeight: FontWeight.bold,
           fontSize: 18,
           ),
        ),
        actions: [
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Icon(Icons.zoom_in_outlined),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: Icon(Icons.menu,),
          )],
      ),

      body: 
      ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical:20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 2),
                  child: Stack(
                    alignment: const Alignment(0.6, 0.6),
                    children: [
                      Expanded(child: const CircleAvatar(
                        radius: 55,
                        backgroundImage: AssetImage(
                          'assets/images/profile.jpg',
                        ),
                       ),),
                       
                       Container(
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 108.0),
                          child: 
                          InkWell(onTap: (){

                          }, 
                          child:
                          Container( 
                            padding: EdgeInsets.all(2),
                            margin: EdgeInsets.all(2),
                            decoration: 
                              BoxDecoration(
                                border: Border.all(color:Colors.white10, width: 1),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(color: Colors.white),
                                ],
                                color: Colors.white54),
                           child:Icon(Icons.camera_alt_outlined, 
                           
                           )),),
                        ),
                        ),
                    ],
                  ),
                ),
            
                // Text('Profile image'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical:8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //name
                      Text("Mahesh Sharma",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),),
                      //email address
                      Text("mahesh.sharma@gmail.com"),
                      // edit profile button
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical:8.0),
                        child: Column(
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 12),
                                backgroundColor: Colors.blue[700],
                                foregroundColor:Colors.white ,
                              ),
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_)=> EditProfilePage()),
                                );
                              },
                              child: Row(
                                children: [
                                  Text("Edit Profile"),
                                  SizedBox( width:5),
                                  Icon(Icons.edit_outlined, 
                                  color: Colors.white,
                                  ),
                                ],
                              ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListView.separated(
            separatorBuilder:(context, index) 
            {
              return   
              Column(
                children: [
                  SizedBox(height:5,),
                  Divider(),
                  SizedBox(height: 5,),
                ],
              );
            }, //ListView.separated separatorBuilder

            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: profileData.length,
            itemBuilder: (context, index) 
            {
            return 
                ProfileWidget(
                  prefixIcon: profileData[index]['icon'],
                  featureName: profileData[index]['title'],
                  suffixIcon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 16,
                    color: Colors.blue[700],
                    ),
                  featureMethod:profileData[index]['method'],
                );
            }
          ),         
        ],    
      ),
    );
  }
}

class EsewaApp {
}

class LogoutButtonWidget {
}  

// TODO: ask permission for camera gallery image on profile image gallery tap

