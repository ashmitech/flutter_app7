
import 'package:flutter/material.dart';
import 'package:my_app/demo_apps/widgets/dropdown_widget.dart';

class FirstRowWidget extends StatelessWidget {
  const FirstRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                      // Distributes items properly
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: 
                              MyDropdown(),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.settings,color: Colors.white, size: 30.0,),
                        ), // This will be on the right side
                      ],
                    ),
                  );

  }
}


/**
 * FutureBuilder(
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
                                  Text("Temperature:${weather.temperature}"),
                                  Text("Condition:${weather.condition}"),
                                  // Text("Range of Temperature: ${weather.condition}"),
                                ],
                              ),
                              );
                              }),
 */

