import 'package:flutter/material.dart';
// import 'package:my_app/demo_apps/form/page/login_form_page.dart';
// import 'package:my_app/demo_apps/profile/page/profile_page.dart';
import 'package:my_app/demo_apps/tourism/widget/tourism_layout_widget/image_section_widget.dart';
import 'package:my_app/demo_apps/tourism/widget/tourism_layout_widget/title_layout_widget.dart';
import 'package:my_app/demo_apps/tourism/widget/tourism_layout_widget/button_layout_widget.dart';
import 'package:my_app/demo_apps/tourism/widget/tourism_layout_widget/text_section_widget.dart';
// import 'package:my_app/demo_apps/weather/page/weather_page.dart';

// import 'package:path/path.dart';

class TourismPage extends StatelessWidget {
  const TourismPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Tourism Application';
    return 
      Scaffold(
        appBar: 
        AppBar(title: const Text(appTitle), 
              centerTitle: true,
              backgroundColor: Colors.red[700],
              foregroundColor: Colors.white,
              actions:[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child:
                  InkWell(
                    // child: UserLoggedInIcon(), 
                    onTap:(){
                        // if(isUserLoggedIn)
                        // {
                        //  MaterialPageRoute<void>(
                        //   builder: (BuildContext context) => ProfilePage(),
                        //   );
                        // }else{
                        //   MaterialPageRoute<void>(
                        //   builder: (BuildContext context) => LoginFormPage(),
                        //   );
                        // }
                       }
                      ),
                  )
                ]
              ),

        body: 
        const SingleChildScrollView(
          child: Column(
            children: [
                ImageSection(
                  image: 'assets/images/lake.jpg'
                  ),
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