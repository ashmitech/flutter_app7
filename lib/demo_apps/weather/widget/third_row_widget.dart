import 'package:flutter/material.dart';

class ThirdRowWidget extends StatelessWidget {
  const ThirdRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    SizedBox(
                    height:250,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                    
                      // Distributes items properly
                      children: [
                        Row(
                          children: [
                            Icon(Icons.wb_sunny,size: 200,color: Colors.yellow[400]),
                          ],
                        ),
                      ],
                    ),
                  );
  }
}