
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
    Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
        child: SizedBox(
          width: double.infinity,
          child: 
            ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.blue.shade100), 
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
                        Icon(prefixIcon??Icons.circle, color: Colors.black,),
                        SizedBox(width: 8,
                          ),
                        Text(name ?? 'H O M E',
                          style: TextStyle(
                            color:Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            ),
                          ),
                      ],
                    ),
                    Icon(suffixIcon??Icons.expand_circle_down_outlined, color: Colors.black,),
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
      ),
    );
  }
}
