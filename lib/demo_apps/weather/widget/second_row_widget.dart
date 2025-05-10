import 'package:flutter/material.dart';

class SecondRowWidget extends StatelessWidget {
  const SecondRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return 
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
                              Text("24".toUpperCase(),style: TextStyle(
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
                        Text("22°/25°".toUpperCase(),style:TextStyle(
                            color:Colors.white,
                            fontSize:20,
                          ),
                          ),            
                      ],
                    ),
                  );
  }
}

