import 'package:flutter/material.dart';
import 'package:my_app/flutter_layout/page/flutter_layout_page.dart';
import 'package:my_app/form/page/form_page.dart';
import 'package:my_app/home/page/home_page.dart';

// current directory for different pages of news

import 'package:my_app/news/page/news_home_page.dart';
import 'package:my_app/news/page/bookmarked_news_page.dart';
import 'package:my_app/news/page/business_news_page.dart';
import 'package:my_app/news/page/sports_news_page.dart';
import 'package:my_app/news/page/tech_news_page.dart';
import 'package:my_app/news/page/science_news_page.dart';

import 'package:my_app/profile/page/profile_page.dart';
import 'package:my_app/sport/page/extract_argument_screen.dart';
import 'package:my_app/sport/page/sports_page.dart';
import 'package:my_app/test/page/test_page.dart';
import 'package:my_app/weather/page/weather_page.dart';
import 'package:my_app/sport/page/sports_detail_page.dart';

class AppRoute {
  static Map<String, WidgetBuilder> routes = {
      "/":(context)=> HomePage(), 
      "/home":(context)=> HomePage(),

      "/all_news_page":(context)=> NewsHomePage(),
      "/bookmarked_news_page":(context)=> AllNewsPage(),
      "/business_news_page":(context)=> BusinesNewsPage(),
      "/sports_news_page":(context)=> SportsNewsPage(),
      "/tech_news_page":(context)=> TechNewsPage(),
      "/science_news_page":(context)=> ScienceNewsPage(),

      "/weather":(context)=> WeatherPage(),

      "/profile":(context)=> ProfilePage(),

      "/form":(context)=>MyCustomForm(),

      "/sports":(context)=> SportPage(),
      "/sports_overview":(context)=> SportsDetailPage(),

      "/test_page":(context)=>TestPage(),
      "/flutterlayout":(context)=>FlutterLayoutDemo(),
      "/extractArguments":(context)=>ExtractArgumentsScreen(),
    
    };
  }

//note (context) => HomePage(), means (cotext) { return HomePage();},