import 'package:flutter/material.dart';
import 'package:my_app/routes/route_page.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        primaryColor: const Color.fromARGB(255, 228, 145, 19)
      ),
      routes: AppRoute.routes,
    );
  }
}
