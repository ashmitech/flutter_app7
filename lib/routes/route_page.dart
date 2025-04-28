import 'package:flutter/material.dart';

import 'package:my_app/demo_apps/home/page/home_page.dart';

class AppRoute {
  static Map<String, WidgetBuilder> routes = {
      "/":(context)=>kHomePage(), 
      "/dashboard":(context)=>kHomePage(),
    };
  }
  