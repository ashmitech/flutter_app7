import 'package:flutter/material.dart';
import 'package:my_app/news/page/news_home_page.dart';
import 'package:my_app/news/page/details_page.dart';

class AppRoute {
  static Map<String, WidgetBuilder> routes = {
      "/":(context)=> NewsHomePage(), 

      "/news_home_page":(context)=> NewsHomePage(),
      "/news_details_page":(context)=> NewsDetailPage(),
    
    };
  }

//note (context) => HomePage(), means (cotext) { return HomePage();},