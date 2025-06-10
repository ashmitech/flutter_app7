import 'package:flutter/material.dart';
import 'package:my_app/demo_apps/profile/widget/profile_widget.dart';
import 'package:my_app/demo_apps/profile/page/edit_profile_page.dart';

class SettingsPage extends StatelessWidget {
   SettingsPage({super.key});

  final List<Map> profileData =[
    {"title":"Download", "icon":Icon(Icons.download)},
    {"title":"Language", "icon":Icon(Icons.language)}, //English // Nepali
    {"title":"Clear History", "icon":Icon(Icons.delete_outline_outlined)},
    {"title":"Location", "icon":Icon(Icons.location_on_outlined)}, // Location address
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        centerTitle: false,
        title: Text("Settings",
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
                                  Icon(Icons.edit_outlined),
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
=======
      appBar: AppBar(
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        centerTitle:false,
        title:Text("Settings", 
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
        ),
        actions:
         <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Edit Settings',
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      body: Center(
      child: Text("⚙️ Settings Page",
       style: TextStyle(fontSize: 24)
       ),
    ),
>>>>>>> f7ad4aa (Added navitation to profile page settings)
    );
    
    
  }
}  
