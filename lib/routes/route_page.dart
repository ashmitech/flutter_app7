import 'package:flutter/material.dart';
import 'package:my_app/demo_apps/home/page/home_page.dart';
import 'package:my_app/demo_apps/profile/page/profile_page.dart';
import 'package:my_app/demo_apps/tourism/page/tourism_layout_page.dart';
import 'package:my_app/demo_apps/weather/page/weather_page.dart';
import 'package:my_app/demo_apps/form/page/login_form_page.dart';
import 'package:my_app/news_apps/screens/home_page.dart';

class AppRoute {
  static Map<String, WidgetBuilder> routes = {
      // "/":(context)=>LoginFormPage(),
      "/":(context)=>NewsHomePage(),
      "/dashboard":(context)=>kHomePage(),
      "/tourism":(context)=>TourismPage(),
      "/weather":(context)=>WeatherPage(),
      "/login_form":(context)=>LoginFormPage(),
      "/profile":(context)=>ProfilePage(),
      "/news_home":(context)=>NewsHomePage(),
    };
  }
  