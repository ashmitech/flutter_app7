import 'package:flutter/material.dart';
import 'package:my_app/demo_apps/form/page/forgot_password_page.dart';
import 'package:my_app/demo_apps/home/page/home_page.dart';
import 'package:my_app/demo_apps/profile/page/edit_profile_page.dart';
import 'package:my_app/demo_apps/profile/page/profile_page.dart';
import 'package:my_app/demo_apps/form/page/login_form_page.dart';
import 'package:my_app/news_apps/screens/home_page.dart';

class AppRoute {
  static Map<String, WidgetBuilder> routes = {
      "/":(context)=>ForgotPasswordPage(),
      "/dashboard":(context)=>kHomePage(),
      "/news_home":(context)=>NewsHomePage(),
      "/login_form":(context)=>LoginFormPage(),
      "/profile":(context)=>ProfilePage(),
      "/edit_profile":(context)=>EditProfilePage(),
      "/forgot_password":(context)=>ForgotPasswordPage(),
    };
  }
  