import 'package:flutter/material.dart';
import 'package:my_app/demo_apps/weather/widget/first_row_widget.dart' show FirstRowWidget;
import 'package:my_app/demo_apps/weather/widget/fourth_row_widget.dart' show FourthRowWidget;
import 'package:my_app/demo_apps/weather/widget/second_row_widget.dart' show SecondRowWidget;
import 'package:my_app/demo_apps/weather/widget/third_row_widget.dart' show ThirdRowWidget; 
// import 'package:url_launcher/url_launcher.dart' show launchUrl;

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // void initState(){
  //   print("test");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Weather Application Page"),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,

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

                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      children: [
                        InkWell(
                      child: Text("Source: The Weather Channel",
                        style:TextStyle(color: Colors.white, fontStyle: FontStyle.italic),),
                      onTap:() {
                        // launchUrl(Uri.parse('https://weather.com'));
                      }
                      ,
                    ),
                      ],
                    ),
                  ),
                ],
            ),        
          ),
        ],
      ),
    );
  }
}