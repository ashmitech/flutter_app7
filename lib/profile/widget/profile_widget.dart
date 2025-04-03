import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget
  ({super.key,
      this.prefixIcon,
      this.featureName,
      this.suffixIcon,
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
              Text(featureName??"Text", style: TextStyle(fontSize: 16),),
            ],
          ),
          suffixIcon??Icon(Icons.error),
        ],
      ),
    );
  }
}

