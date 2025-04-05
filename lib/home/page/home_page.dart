import 'package:flutter/material.dart';
import 'package:my_app/home/widget/home_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Map> homeData=[
    {"prefixIcon":Icons.newspaper,
     "name":"N E W S ",
     "routeName":"/all_news_page"},

    {"prefixIcon":Icons.newspaper,
     "name":" D E T A I L  N E W S  P A G E ",
     "routeName":"/news_details_page"},
    
    {"prefixIcon":Icons.sunny,
     "name":"W E A T H E R",
      "routeName":"/weather"},
    
    {"prefixIcon":Icons.layers_outlined,
     "name":"F L U T T E R  L A Y O U T ",
     "routeName":"/flutterlayout"},

     {"prefixIcon":Icons.layers_outlined,
     "name":"Test",
     "routeName":"/test"},
  ];
     
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        title: Text(" A P P L I C A T I O N S   D E M O",
        style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
      ),
    body: 
    
    Container(
      margin: EdgeInsets.all(10),
      child: ListView.builder(
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
    ),
    );
  }
}

