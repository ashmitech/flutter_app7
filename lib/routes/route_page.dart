import 'package:flutter/material.dart';
import 'package:my_app/news/screens/home_page.dart';
import 'package:my_app/news/screens/details_page.dart';

class AppRoute {
  static Map<String, WidgetBuilder> routes = {
      "/":(context)=>HomePage(), 
      "/news_home":(context)=>HomePage(),
      "/news_details":(context)=>DetailsPage(),
    };
  }
  