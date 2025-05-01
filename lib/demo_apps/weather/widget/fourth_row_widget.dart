import 'package:flutter/material.dart';


class FourthRowWidget extends StatelessWidget {
  FourthRowWidget({super.key});
// list of information for preciding
  final List<Map> forecastData=[
    {"tempDate":"10/04","prefixIcon":Icons.sunny,"tempName":"Sunny","tempTemperature":"22°/24°"},
    {"tempDate":"10/04","prefixIcon":Icons.cloudy_snowing,"tempName":"Rainy","tempTemperature":"20°/18°"},
    {"tempDate":"10/04","prefixIcon":Icons.wb_cloudy,"tempName":"Cloudy","tempTemperature":"18°/20°"},
    {"tempDate":"10/04","prefixIcon":Icons.sunny,"tempName":"Sunny","tempTemperature":"22°/24°"},
    {"tempDate":"10/04","prefixIcon":Icons.cloudy_snowing,"tempName":"Rainy","tempTemperature":"20°/18°"},
    {"tempDate":"10/04","prefixIcon":Icons.wb_cloudy,"tempName":"Cloudy","tempTemperature":"18°/20°"},
  ];

  @override
  Widget build(BuildContext context) {
    return 
    Column(
      children: [
        //row for heading
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(height:50,
          width: 450,
          padding: EdgeInsets.symmetric(horizontal:25, vertical:25),
          color: Colors.amber[50],
          )
        ],
        ),
          Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // Distributes items properly
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
            Text(tempDate??"n/a",
            style:TextStyle(fontSize: 18, color: Colors.blue[700],)),
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
