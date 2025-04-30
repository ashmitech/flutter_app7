import 'package:flutter/material.dart';
import 'package:my_app/demo_apps/weather/widget/feature_widget.dart' show WeatherForecastWidget;

class FourthRowWidget extends StatelessWidget {
  FourthRowWidget({super.key});
// list of information for preciding
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
    return 
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
                  );
  }
}
