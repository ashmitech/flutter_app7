
import 'package:flutter/material.dart';

class SearchPageWidget extends StatelessWidget {
  const SearchPageWidget(
    {
      super.key, 
      required this.item, 
      required this.routeName, 
      this.prefixIcon, 
      this.suffixIcon,
    });

    final String?item;
    final String?routeName;
    final IconData?prefixIcon;
    final IconData?suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Padding(padding: const EdgeInsets.symmetric(horizontal:8.0, vertical:8),
      child: 
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(prefixIcon),
          TextButton(
            onPressed: (){
              Navigator.pushNamed(
                  context, routeName??'/'
                  );
            },
            child: Text(item??"News Home", style: TextStyle(fontSize: 18.0),)
          ),
          
          Row(
            children: [
              Icon(
                suffixIcon, 
                color: Colors.blue.shade200
                ),
            ],
          ),
          ],
      ),
      ),
      ],
    );
  }
}
