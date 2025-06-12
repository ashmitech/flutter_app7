import 'package:flutter/material.dart';
import 'package:my_app/demo_apps/profile/widget/profile_widget.dart';

class SettingsPage extends StatelessWidget {
   SettingsPage({super.key});

  final List<Map> profileData =[
    
    {"title":"Language", "icon":Icon(Icons.language_outlined)}, //English // Nepali
    {"title":"Font Size", "icon":Icon(Icons.font_download_outlined)}, //change font size
    {"title":"Screen Mode", "icon":Icon(Icons.screen_lock_portrait_outlined)}, // Scree mode address
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Change Settings',
            onPressed: () {
              // handle the press
            },
            ),
          )],
      ),

      body: 
      ListView(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(8.0),
                padding:EdgeInsets.all(8.0),
                  child: 
                    Text("Change Settings", 
                    style: TextStyle(
                      fontSize: 18.0, 
                      fontWeight: FontWeight.bold),
                      ),
                ),
            ],
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
                ProfileListWidget(
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
