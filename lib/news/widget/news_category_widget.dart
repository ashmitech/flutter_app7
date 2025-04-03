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
  final List<Map<String,dynamic>> categoriesList = [
    {
      'title':'All news',
      'routeName':"/all_news"
    },
    
     {
      'title':'Business',
      'routeName':"/business_news"
     },

    {
      'title':'Sports',
      'routeName':"/sports_news"
    },

    {
      'title':'Tech',
      'routeName':"/tech_news"
    },

    {
      'title':"Science",
      'routeName':"/science_news"
    },
  ];
  bool cat=false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: 

        ListView.builder(
          itemCount: categoriesList.length,
          itemBuilder: (context,index){
            return 
              Row(children: [
                CatWidget(
                  title: categoriesList[index]['title']??'all news',
                  routeName: categoriesList[index]['/all_news']??'/',
                )
              ],
            );
          }),
      ),
    );
  }
}

// categories.map((category) => Padding(
            //         padding: const EdgeInsets.only(right: 10),
            //         child: ElevatedButton(
            //           onPressed: () {
            //             setState(() {
            //             });
            //           },
            //           style: ElevatedButton.styleFrom(
            //             foregroundColor: category == categories.first
            //                 ? Colors.white
            //                 : Colors.black,
            //             backgroundColor: category == categories.first
            //                 ? Color.fromARGB(255, 178, 18, 7)
            //                 : Colors.grey[200],
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(20),
            //             ),
            //           ),
            //           child: Text(category),
            //         ),
            //       ),
            //       )
            //   .toList(),

class CatWidget extends StatelessWidget {
  const CatWidget({
      super.key,
      required this.title,
      required this.routeName
    });
  final String?title;
  final String?routeName;

  final int number=0;

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      child: Text(title??'All News'),
      onPressed: (){
        Navigator.pushNamed(
          context, 
            routeName??"/");
        
      })
      ;
  }
}