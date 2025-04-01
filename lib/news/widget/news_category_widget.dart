import 'package:flutter/material.dart';

class NewsCategoryWidget extends StatelessWidget {

  final List<String> categories = ['All news', 'Business', 'Sports', 'Tech', "Science"];

  NewsCategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Row(
          children: categories
              .map((category) => Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      onPressed: () {
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: category == categories.first
                            ? Colors.white
                            : Colors.black,
                        backgroundColor: category == categories.first
                            ? Color.fromARGB(255, 178, 18, 7)
                            : Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(category),
                    ),
                  ),
                  )
              .toList(),
        ),
      ),
    );
  }
}