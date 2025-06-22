import 'package:flutter/material.dart';
import 'package:my_app/demo_apps/settings/page/details_page.dart';


// ignore: camel_case_types
class kSettingsPage extends StatelessWidget {
  const kSettingsPage({super.key});

  @override
  // demo app settings page
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings Demo"),
        backgroundColor: Colors.brown.shade400,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed:()=> openPage(context),
          child: const Text('Details Page'),)
      ),
    );
  }
  
  openPage(context) {
    // print('TEST');
    Navigator.push(
      context as BuildContext, MaterialPageRoute(builder: (context)=>DetailsPage()));
  }
}