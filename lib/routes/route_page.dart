import 'package:flutter/material.dart';
import 'package:my_app/demo_apps/form/page/registration_form_page.dart';
import 'package:my_app/demo_apps/home/page/home_page.dart';
import 'package:my_app/demo_apps/profile/page/profile_page.dart';
import 'package:my_app/demo_apps/form/page/login_form_page.dart';
import 'package:my_app/news_apps/screens/home_page.dart';
import 'package:my_app/news_apps/screens/pages/technology_page.dart';
import 'package:my_app/news_apps/screens/search_page.dart';

class AppRoute {
  static Map<String, WidgetBuilder> routes = {
      "/":(context)=>kHomePage(),
      "/dashboard":(context)=>kHomePage(),
      "/login_form":(context)=>LoginFormPage(),
      "/registration_form":(context)=>RegistrationForm(),
      "/profile":(context)=>ProfilePage(),
      "/news_home":(context)=>NewsHomePage(),
      "/search_page":(context)=>SearchPage(),
      "/technology_page":(context)=>TechnologyPage(),
      };
  }