import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget
  ({super.key,
      //attributes
      this.prefixIcon,
      this.featureName,
      this.suffixIcon, 
      this.routeName, required featureMethod,
    });

    final Icon?prefixIcon;
    final String?featureName;
    final Icon?suffixIcon;
    final dynamic routeName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical:10),
          child: 
          InkWell(onTap: (){
            // builder: (_)=> EditProfilePage()
            Navigator.push(context, 
            MaterialPageRoute(
              // routeName
              builder: (_)=>routeName??"HomePage"));
          },
          child:
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  prefixIcon??Icon(Icons.error),
                  SizedBox(width: 8),
                  Text(featureName??"Text", 
                  style: TextStyle(fontSize: 14),),
                ],
              ),
              suffixIcon??Icon(Icons.error),
            ],
          ),
          ),
        ),
      
      ],

    );
  }
}

