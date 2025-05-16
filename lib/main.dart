import 'package:flutter/material.dart';
import 'package:my_app/routes/route_page.dart';
void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "News Apps Demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        primaryColor: Colors.blue[700]
      ),
      routes: AppRoute.routes,

    );
  }
}