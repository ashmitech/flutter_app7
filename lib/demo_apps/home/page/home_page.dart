import 'package:flutter/material.dart';
import 'package:my_app/demo_apps/home/widget/home_widget.dart';

// ignore: camel_case_types 
class kHomePage extends StatelessWidget {
  kHomePage({super.key});

  final List<Map> homeData=[
    
    {"prefixIcon":Icons.newspaper, "name":"News Application", "routeName":"/news_home"},
    {"prefixIcon":Icons.format_align_justify_outlined,"name":"Login/Registration Form", "routeName":"/login_form", "suffixIcon":Icons.expand_circle_down_outlined},
    {"prefixIcon":Icons.verified_user_sharp, "name":"Profile Application", "routeName":"/profile"},
    {"prefixIcon":Icons.search_outlined, "name":"Search Application", "routeName":"/search_page"},
    {"prefixIcon":Icons.bookmark_outlined, "name":"Bookmark Application", "routeName":"/bookmark_page"},
    {"prefixIcon":Icons.settings_outlined, "name":"Settings Application", "routeName":"/settings_page"},

  ];
     
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        title: Text(" Flutter Apps Demo ",style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
      ),
    body: 
    ListView.builder(
     shrinkWrap: false,
     physics: NeverScrollableScrollPhysics(),
     itemCount: homeData.length,
       itemBuilder: (context,index){
         return
           HomeWidget(
             prefixIcon: homeData[index]['prefixIcon'],
             name:homeData[index]['name'],
             routeName: homeData[index]['routeName'],
             suffixIcon: homeData[index]['suffixIcon'],
           ); 
        },
       ),
    );
  }
}

