import 'package:flutter/material.dart';
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
        title: Text("Weather Application "),
        centerTitle: false,
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: 
            InkWell(
              child:UserLoggedInIcon(),
              onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>ProfilePage()));
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

bool isUserLoggedIn =true;
class UserLoggedInIcon extends StatelessWidget 
{
  const UserLoggedInIcon({super.key});
  @override
  Widget build(BuildContext context) {
    //check login status and return the appropriate widget
    if(!isUserLoggedIn){
      return const Icon(Icons.verified_user_outlined);
    }else{
      
      return SizedBox(
        width: 40, // Circle diameter = 2 * radius
        height: 40,
        child: 
        ClipOval(
          child: Center(
            child: SizedBox(
              width: 50, // Size of the image inside the circle
              height: 50,
              child: 
              Image.asset('assets/images/profile.jpg'),
            ),
          ),
        ),
      );
    }
  }
}