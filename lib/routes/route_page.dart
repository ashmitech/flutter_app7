import 'package:flutter/material.dart';
import 'package:my_app/tourism/page/tourism_layout_page.dart';
import 'package:my_app/form/page/form_page.dart';
import 'package:my_app/home/page/home_page.dart';

import 'package:my_app/news/pages/home_page.dart'; // current directory

import 'package:my_app/profile/page/profile_page.dart';
import 'package:my_app/sport/page/extract_argument_screen.dart';
import 'package:my_app/sport/page/sports_page.dart';
import 'package:my_app/test/page/test_page.dart';
import 'package:my_app/weather/page/weather_page.dart';
import 'package:my_app/sport/page/sports_detail_page.dart';

class AppRoute {
  static Map<String, WidgetBuilder> routes = {
      "/data":(context)=>TourismPage(), 
      
      "/tourism":(context)=>TourismPage(), 
      //HomePage(), //current direcotry 
      "/home":(context)=> HomePage(),

      "/news":(context)=> NewsHomePage(),

      "/weather":(context)=> WeatherPage(),

      "/profile":(context)=> ProfilePage(),

      "/sports":(context)=> SportPage(),
      "/sports_overview":(context)=> SportsDetailPage(),

      "/test_page":(context)=>TestPage(),
      "/extractArguments":(context)=>ExtractArgumentsScreen(),
      
      "/form":(context)=>MyCustomForm(),

      // "/flutterlayout":(context)=>FlutterLayoutDemo(),

    };
  }

//note (context) => HomePage(), means (cotext) { return HomePage();},