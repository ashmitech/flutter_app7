import 'package:flutter/material.dart';
import 'package:my_app/demo_apps/weather/services/api_services.dart';
class FourthRowWidget extends StatelessWidget {
 const FourthRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Column(
      children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height:160,
                        width: 450,
                        decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        ),
                        padding:EdgeInsets.symmetric(horizontal: 25,vertical: 25),
                        child: 
                        FutureBuilder(
        future: fetchDummyWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No weather data found.'));
          }
          final weather =snapshot.data!;
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Location:${weather.location}",style:TextStyle(fontSize:20)),
                
              ],
             ),
            );
            }),
          
        ),
      ],
    ),

      ],
    );
  
  }
}

class WeatherForecastWidget extends StatelessWidget {
  const WeatherForecastWidget({
    super.key,
    this.tempDate,
    this.prefixIcon,
    this.tempName,
    this.tempTemperature,
    this.suffixIcon,
  });
  
  final IconData?prefixIcon;
  final String?tempName;
  final String?tempTemperature;
  final IconData?suffixIcon;
  final String?tempDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(tempDate??"N.A.",
            style:TextStyle(fontSize: 16, color: Colors.blue[700],)),
            SizedBox(width: 5,),
            Icon(prefixIcon??Icons.sunny,color: Colors.blue[700],),
            SizedBox(width: 5,),
            Text(tempName??"Sunny",
             style: TextStyle(fontSize:18,color:Colors.blue[700],fontWeight: FontWeight.bold),),    
          ],
        ),
        
        Text(tempTemperature??"20°/24°",style:TextStyle(
          fontSize:14,color:Colors.blue[700],fontWeight: FontWeight.bold)),
            // SizedBox(width: 5,),
      ],
    );
  }
}