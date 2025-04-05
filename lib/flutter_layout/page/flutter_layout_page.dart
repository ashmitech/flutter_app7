import 'package:flutter/material.dart';
import 'package:my_app/flutter_layout/widget/button_layout_widget.dart';
import 'package:my_app/flutter_layout/widget/title_layout_widget.dart';

class FlutterLayoutDemo extends StatelessWidget {
  const FlutterLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'F L U T T E R   L A Y O U T   D E M O';
    return 
      Scaffold(
        appBar: AppBar(title: const Text(appTitle)),
        body: 
        const SingleChildScrollView(
          child: Column(
            children: [
              TitleSection(
                name: 'Oeschinen Lake Campground',
                location: 'Kandersteg, Switzerland'
                ),
              ButtonSection(),  
              ],
            ),
        )
      );
  }
}