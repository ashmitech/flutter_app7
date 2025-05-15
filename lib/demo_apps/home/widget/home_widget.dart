
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget(
    {
      super.key,
      this.prefixIcon,
      this.name,
      this.routeName,
      this.suffixIcon,
    });

  final IconData?prefixIcon;
  final String?name;
  final String?routeName;
  final IconData?suffixIcon;
  
  @override
  Widget build(BuildContext context) {
  return
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
      child: SizedBox(
        width: double.infinity,
        child: 
          ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.brown[700]), 
          ),
          child:
          Padding(
            padding: EdgeInsets.all(8.0),
            child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(prefixIcon??Icons.circle, color: Colors.white,),
                      SizedBox(width: 8,
                        ),
                      Text(name ?? 'H O M E',
                        style: TextStyle(
                          color:Colors.white,
                          fontSize: 16,
                          ),
                        ),
                    ],
                  ),
                  Icon(suffixIcon??Icons.expand_circle_down_outlined, color: Colors.white,),
                ],
              )   
            ),
          
          onPressed: () {
            Navigator.pushNamed(
              context, routeName ?? "/"
              );
          },
        ),
      ),
    );
  }
}
