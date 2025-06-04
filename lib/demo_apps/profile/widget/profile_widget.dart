import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget
  ({super.key,
      //attributes
      this.prefixIcon,
      this.featureName,
      this.suffixIcon, 
      //TODO:methods test for navigation
      required featureMethod,
    });

    final Icon?prefixIcon;
    final String?featureName;
    final Icon?suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical:10),
      child: Row(
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
    );
  }
}

