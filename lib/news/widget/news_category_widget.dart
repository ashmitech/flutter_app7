import 'package:flutter/material.dart';
// import 'package:my_app/news/model/news_data_model.dart';

class NewsCategoryWidget extends StatefulWidget {
   const NewsCategoryWidget({
    super.key,
  });

  @override
  State<NewsCategoryWidget> createState() => _NewsCategoryWidgetState();
}

class _NewsCategoryWidgetState extends State<NewsCategoryWidget> {
  final List<String> categories = ['All news', 'Business', 'Sports', 'Tech', "Science"];
  bool categoryClicked=false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: 
        Row(
          children: 
            categories.map((category) => Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                        });
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