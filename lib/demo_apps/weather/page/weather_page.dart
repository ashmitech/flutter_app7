import 'package:flutter/material.dart';
import 'package:my_app/demo_apps/weather/widget/user_login_widget.dart' show UserLoginWidget, isUserLoggedIn;
import 'package:my_app/demo_apps/form/page/login_form_page.dart' show LoginFormPage;
import 'package:my_app/demo_apps/profile/page/profile_page.dart';
import 'package:my_app/demo_apps/weather/widget/fifth_row_widget.dart';
import 'package:my_app/demo_apps/weather/widget/first_row_widget.dart' show FirstRowWidget;
import 'package:my_app/demo_apps/weather/widget/second_row_widget.dart' show SecondRowWidget;
import 'package:my_app/demo_apps/weather/widget/third_row_widget.dart' show ThirdRowWidget;
import 'package:my_app/demo_apps/weather/widget/fourth_row_widget.dart' show FourthRowWidget;
import 'package:my_app/demo_apps/weather/widget/fifth_row_widget.dart' show FifthRowWidget;


class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Weather Application"),
        centerTitle: false,
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: 
            InkWell(
              // login status is passed here from the user login widget
              child:UserLoginWidget(isUserLoggedIn),
              onTap:(){
                if(isUserLoggedIn){
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>ProfilePage()));
                }else{
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>LoginFormPage()));
                }
                
              }
            ),
          ),
        ],
      ),
      body: 
      ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                  Container(
                  height: 25.0
                  ),
                  FirstRowWidget(),
                  SecondRowWidget(),
                  ThirdRowWidget(),
                  FourthRowWidget(),
                  FifthRowWidget(),
                ],
            ),        
          ),
        ],
      ),
    );
  }
}

