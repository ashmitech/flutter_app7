import 'package:flutter/material.dart';
import 'package:my_app/tourism/widget/tourism_layout_widget/button_layout_widget.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location});

    final String?name;
    final String?location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  name??"", 
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                location??"",
                 style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          const FavouriteWidget(),
        ],
      ),
      // Icon(Icons.star, color:Colors.red.shade800),
      // const Text('41')
    );
  }
}
