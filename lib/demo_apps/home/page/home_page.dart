import 'package:flutter/material.dart';
import 'package:my_app/demo_apps/home/widget/home_widget.dart';

// ignore: camel_case_types 
class kHomePage extends StatelessWidget {
  kHomePage({super.key});

  final List<Map> homeData=[
    {"prefixIcon":Icons.layers_outlined, "name":"Tourism Application", "routeName":"/tourism"},
    {"prefixIcon":Icons.sunny, "name":"Weather Application", "routeName":"/weather"},
    {"prefixIcon":Icons.format_align_justify_outlined,"name":"Login/Registration Form", "routeName":"/login_form", "suffixIcon":Icons.expand_circle_down_outlined},
    {"prefixIcon":Icons.verified_user_sharp, "name":"Profile Application", "routeName":"/profile"},
    {"prefixIcon":Icons.newspaper, "name":"News Application", "routeName":"/news_home"},
    {"prefixIcon":Icons.sports_soccer, "name":"Sports Application", "routeName":"/sports"},
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

