import 'package:flutter/material.dart';
import 'package:my_app/profile/widget/profile_widget.dart' show ProfileWidget;

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final List<Map> profileData =[
    {"title":"Favrorite", "icon":Icon(Icons.favorite_outline)},
    {"title":"Download", "icon":Icon(Icons.download)},
    {"title":"Language", "icon":Icon(Icons.language)},
    {"title":"Location", "icon":Icon(Icons.location_on_outlined)},
    {"title":"Subscription", "icon":Icon(Icons.subscriptions_outlined)},
    {"title":"Clear History", "icon":Icon(Icons.delete_outline_outlined)},
    {"title":"Log Out", "icon":Icon(Icons.logout_rounded)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        title: Text("My Profile",
         style:TextStyle(
          fontWeight: FontWeight.bold,
           fontSize: 18
           ),
        ),
        actions: [
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Icon(Icons.zoom_in_outlined),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: Icon(Icons.settings,),
          )],
          centerTitle: true,
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
                          padding: const EdgeInsets.only(left: 78.0),
                          child: 
                          InkWell(onTap: (){},
                          child:
                          Container( decoration: const BoxDecoration(color: Colors.white),
                           child:Icon(Icons.camera_alt_outlined, )),),
                          
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
                      Text("Mahesh Sharma",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),),
                      Text("mahesh.sharma@gmail.com"),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical:8.0),
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: (){
                              // Navigator.of(context).push(_editPageRoute);
                              },
                              child: Text("Edit Profile"),
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
                  suffixIcon: Icon(Icons.arrow_forward_ios_outlined, size: 16,),
                );
            }
          ),         
        ],    
      ),
    );
  }
}  


        
    
    
    
  

