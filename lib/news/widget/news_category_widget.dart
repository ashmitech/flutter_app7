import 'package:flutter/material.dart';

class NewsCategoryWidget extends StatelessWidget {
  final List<String> categories;
  final ValueChanged<String> onCategorySelected; // Callback for when a category is tapped

  const NewsCategoryWidget({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories
            .map((category) => Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      onCategorySelected(category);
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
    );
  }
}