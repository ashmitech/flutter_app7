import 'package:flutter/material.dart';
import 'package:my_app/demo%20apps/weather/widget/feature_widget.dart' show WeatherForecastWidget; 
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
 

  final List<Map> forecastData=[
    {"prefixIcon":Icons.sunny,"tempName":"Sunny","tempTemperature":"22°/24°"},
    {"prefixIcon":Icons.cloudy_snowing,"tempName":"Rainy","tempTemperature":"20°/18°"},
    {"prefixIcon":Icons.wb_cloudy,"tempName":"Cloudy","tempTemperature":"18°/20°"},
    {"prefixIcon":Icons.sunny,"tempName":"Sunny","tempTemperature":"22°/24°"},
    {"prefixIcon":Icons.cloudy_snowing,"tempName":"Rainy","tempTemperature":"20°/18°"},
    {"prefixIcon":Icons.wb_cloudy,"tempName":"Cloudy","tempTemperature":"18°/20°"},
  ];

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

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                      // Distributes items properly
                      children: [
                        Row(
                          children: [
                            Text("new york".toUpperCase(),
                            style: TextStyle(color: Colors.white,fontSize: 20, fontWeight:FontWeight.bold),),
                            SizedBox(width: 5,),
                            Icon(Icons.location_pin, color: Colors.white, size: 20.0,),
                            Icon(Icons.arrow_drop_down, color: Colors.white, size: 30.0,),
                          ],
                        ),
                        Icon(Icons.settings,color: Colors.white, size: 30.0,), // This will be on the right side
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.start, 
                      crossAxisAlignment: CrossAxisAlignment.end,
                    
                      // Distributes items properly
                      children: [
                      
                        SizedBox(
                          height:110,
                          // color: Colors.red,
                          child: Row(
                            children: [
                              Text("22".toUpperCase(),style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 100,
                                  fontWeight: FontWeight.bold,
                              ),),
                            Text("°".toUpperCase(),style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                              ),),
                      ],
                          ),
                        ),
                        Text("sunny ".toUpperCase(),style:TextStyle(
                              color:Colors.white,
                              fontSize: 20, 
                            )
                            ),
                        SizedBox(width: 5,),
                        Text("20°/24°".toUpperCase(),style:TextStyle(
                            color:Colors.white,
                            fontSize:20,
                          ),
                          ),            
                      ],
                    ),
                  ),

                  SizedBox(
                    height:250,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                    
                      // Distributes items properly
                      children: [
                        Row(
                          children: [
                            Icon(Icons.sunny,size: 200,color: Colors.yellow),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // Distributes items properly
                    children: [
                      Container(
                        height:160,
                        width: 350,
                        decoration: BoxDecoration(
                        color:Colors.blue[200],
                        borderRadius: BorderRadius.circular(20),
                        
                        ),
                        padding:EdgeInsets.symmetric(horizontal: 25,vertical: 25),
                      
                        child: 
                        ListView.builder(
                          itemCount: forecastData.length,
                          itemBuilder: (context, index) =>
                          WeatherForecastWidget(
                            prefixIcon: forecastData[index]["prefixIcon"],
                            tempName: forecastData[index]["tempName"],
                            tempTemperature: forecastData[index]["tempTemperature"],
                          ), 
                        ),
                      ),
                    ],
                  ),

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

