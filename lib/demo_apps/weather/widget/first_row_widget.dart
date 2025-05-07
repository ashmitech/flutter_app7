
import 'package:flutter/material.dart';

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
                              child: Text("kathmandu".toUpperCase(),
                              style: TextStyle(color: Colors.white,fontSize: 20, fontWeight:FontWeight.bold),),
                            ),
                            SizedBox(width: 5,),
                            Icon(Icons.location_pin, color: Colors.white, size: 20.0,),
                            Icon(Icons.arrow_drop_down, color: Colors.white, size: 30.0,),
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

