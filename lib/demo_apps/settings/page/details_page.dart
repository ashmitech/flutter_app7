import 'package:flutter/material.dart';
import 'package:my_app/demo_apps/settings/page/settings_page.dart';
import 'package:my_app/news_apps/screens/settings_page.dart';


class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        backgroundColor: Colors.blue.shade400,
        foregroundColor: Colors.white,
      ),
      body: 
      Center(
        child: ElevatedButton(
          onPressed:()=> openPage(context),
          child: Text("Settings Page"),
          ),
        ),
    );
  }

  void openPage(context) {
    // print("TEST");
    Navigator.push(context, MaterialPageRoute(builder: (context)=>kSettingsPage()));
  }
}