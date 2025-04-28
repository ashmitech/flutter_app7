import 'package:flutter/material.dart'; 

class WeatherForecastWidget extends StatelessWidget {
  const WeatherForecastWidget({
    super.key,
    this.prefixIcon,
    this.tempName,
    this.tempTemperature,
    this.suffixIcon,
  });
  
  final IconData?prefixIcon;
  final String?tempName;
  final String?tempTemperature;
  final IconData?suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(prefixIcon??Icons.sunny,color: Colors.white,),
            SizedBox(width: 5,),
            Text(tempName??"Sunny",
             style: TextStyle(fontSize:20,color:Colors.white,fontWeight: FontWeight.bold),),    
          ],
        ),
        
        Text(tempTemperature??"20°/24°",style:TextStyle(
          fontSize:14,color:Colors.white,fontWeight: FontWeight.bold)),
            // SizedBox(width: 5,),
      ],
    );
  }
}