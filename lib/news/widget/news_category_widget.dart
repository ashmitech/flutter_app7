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
  final List<String> categories = [
    'All news',
    'Business', 
    'Sports', 
    'Tech', 
    "Science"
    ];
  // bool cat=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body: Column(
        children: 
     
          categories.map(
            (category) 
              =>
                ElevatedButton(
                  onPressed: () {
                    // setState(() {
                    // });
                  },
                // style: ElevatedButton.styleFrom(
                //   foregroundColor: category == categories.first
                //       ? Colors.white
                //       : Colors.black,
                //   backgroundColor: category == categories.first
                //       ? Color.fromARGB(255, 178, 18, 7)
                //       : Colors.grey[200],
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(20),
                //   ),
                // ),
                child: Text(category),
            ),
        ).toList(),
      ),      
    );
  }//widget
} //news Category state widget

          // Row(
          // children: [
          //   CatWidget(),
          // ],
          // ),
          
// class CatWidget extends StatefulWidget {
//   const CatWidget({super.key});

//   @override
//   State<CatWidget> createState() => _CatWidgetState();
// }

// class _CatWidgetState extends State<CatWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: (){

//       },
//       child: Text('CLick Me'));
//   }
// }