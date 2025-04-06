import 'package:flutter/material.dart';
import 'package:my_app/flutter_layout/widget/button_layout_widget.dart';
import 'package:my_app/flutter_layout/widget/image_section_widget.dart';
import 'package:my_app/flutter_layout/widget/title_layout_widget.dart';
import 'package:my_app/flutter_layout/widget/text_section_widget.dart';

class FlutterLayoutDemo extends StatelessWidget {
  const FlutterLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Some Beautiful Places';
    return 
      Scaffold(
        appBar: AppBar(title: const Text(appTitle), centerTitle: true,),
        body: 
        const SingleChildScrollView(
          child: Column(
            children: [
                ImageSection(image: 'images/assets/lake.jpg'),
                TitleSection(
                name: 'Oeschinen Lake Campground',
                location: 'Kandersteg, Switzerland',
                ),
                ButtonSection(),
                TextSection(
                  description:
                      'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                      'Bernese Alps. Situated 1,578 meters above sea level, it '
                      'is one of the larger Alpine Lakes. A gondola ride from '
                      'Kandersteg, followed by a half-hour walk through pastures '
                      'and pine forest, leads you to the lake, which warms to 20 '
                      'degrees Celsius in the summer. Activities enjoyed here '
                      'include rowing, and riding the summer toboggan run.',
                ),
              ],
            ),
        )
      );
  }
}