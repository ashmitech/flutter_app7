import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:flutter/material.dart';
import 'package:my_app/demo_apps/form/page/login_form_page.dart';
import 'package:my_app/demo_apps/form/page/login_form_page.dart';
import 'package:my_app/demo_apps/home/page/home_page.dart';

// import 'package:my_app/demo_apps/home/page/home_page.dart';
import 'package:my_app/demo_apps/profile/widget/profile_widget.dart' show ProfileWidget;
import 'package:my_app/demo_apps/profile/page/edit_profile_page.dart' show EditProfilePage;
import 'package:my_app/demo_apps/subscription/page/subscription_page.dart' show SubscriptionPage;
import 'package:my_app/news_apps/screens/settings_page.dart'show SettingsPage;
import 'package:my_app/news_apps/screens/bookmark_page.dart'show BookmarkPage;

import 'package:my_app/news_apps/screens/home_page.dart';
import 'package:my_app/widgets/logout_widget/logout_widget.dart';
// ignore: unused_import
import 'package:my_app/function/esewa.dart'; 
// ignore: unused_import
import 'package:path/path.dart';



class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  dynamic routeName=kHomePage();

  final List<Map> profileData =[
    //map
    {
    "title":"Settings", 
    "icon":Icon(Icons.settings_outlined),
    "routeName":SettingsPage(),
    },

    {
    "title":"Bookmark",
    "icon":Icon(Icons.bookmark_outline),
    "routeName":BookmarkPage(bookmarkedItems: [],),
    },
     
    {
    "title":"Subscription",
    "icon":Icon(Icons.newspaper_outlined,),
    "routeName":SubscriptionPage()
    }, 

    {
    "title":"Logout",
    "icon":Icon(Icons.logout_outlined,),
    "routeName":LoginFormPage()
    }, 
  ];

  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
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
          child: 
          InkWell(
          onTap: () => Navigator.push(context, 
          MaterialPageRoute(builder: (_)=>SettingsPage())),
          child: Icon(Icons.zoom_in_outlined),
          )
          
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: 
            InkWell(onTap: ()=>Navigator.push(context, 
            MaterialPageRoute(builder: (_)=>NewsHomePage())),
            child: Icon(Icons.home,)

            ),
            ),
            
            ],
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
                            // permission to the camera and gallery
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
                                child:
                                Icon(Icons.camera_alt_outlined, 
                             )
                           ),),
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
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.edit_outlined, 
                                    color: Colors.white,
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
            Column(
              children: [
                  ProfileWidget(
                  prefixIcon: profileData[index]['icon'],
                  featureName: profileData[index]['title'],
                  suffixIcon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 16,
                    color: Colors.blue[700],
                    ),
                  routeName:profileData[index]['routeName'], featureMethod: null,
                ),
                  // widget for logout
                  InkWell(onTap: (){
                    
                    // builder: (_)=> EditProfilePage()
                    Navigator.push(context, 
                    MaterialPageRoute(
                      // routeName
                      builder: (_)=>LoginFormPage()));
                  },
                  
                  child:
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Row(
                      //   children: [
                      //     prefixIcon??Icon(Icons.error),
                      //     SizedBox(width: 8),
                      //     Text(featureName??"Text", 
                      //     style: TextStyle(fontSize: 14),),
                      //   ],
                      // ),
                      // suffixIcon??Icon(Icons.error),
                    ],
                  ),
                  ),    
              ],
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

// TODO: 
     // logout button in the profile page change this color to red
     // ask user are you sure you want to logout dialog box
      
      // to ask permission for camera gallery image on profile image gallery tap
      // to request for the esewa application login on click of the subscribe button

