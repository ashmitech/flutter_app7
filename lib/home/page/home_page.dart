import 'package:flutter/material.dart';
import 'package:my_app/home/widget/home_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Map> homeData=[
    {"prefixIcon":Icons.newspaper, "name":"N E W S ", "routeName":"/news"},
    {"prefixIcon":Icons.format_align_justify_outlined,"name":"F O R M", "routeName":"/form", "suffixIcon":Icons.expand_circle_down_outlined},
    {"prefixIcon":Icons.sunny, "name":"W E A T H E R", "routeName":"/weather"},
    {"prefixIcon":Icons.verified_user_sharp, "name":"P R O F I L E", "routeName":"/profile"},
    {"prefixIcon":Icons.sports_soccer, "name":"S P O R T S", "routeName":"/sports"},
    {"prefixIcon":Icons.layers_outlined, "name":"F L U T T E R  L A Y O U T ", "routeName":"/flutterlayout"},

  ];
     
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        title: Text(" A P P L I C A T I O N S ",style: TextStyle(fontWeight: FontWeight.bold),
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

