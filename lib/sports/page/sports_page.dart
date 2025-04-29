import 'package:flutter/material.dart';
import 'package:my_app/sports/widget/sport_widget.dart';

class SportPage extends StatelessWidget {
  SportPage({
    super.key
  });

final List<Map<String, String>> sportsOptions = [
      {"name": "Sports Overview", "route": '/sports_overview'},
      {"name": "Match Schedule", "route": '/match_schedule'},
      {"name": "Match Schedule", "route": '/match_schedule'},
      {"name": "Match Schedule", "route": '/match_schedule'},
      {"name": "Match Schedule", "route": '/match_schedule'},
      {"name": "Match Schedule", "route": '/match_schedule'},
    ]; 

final List<Map<String, String>> sportsBanner = [
      {"image": "assets/images/banner.jpg"},
      {"image": "assets/images/banner.jpg"},
      {"image": "assets/images/banner.jpg"},
    ]; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Discover"),
        backgroundColor: Colors.grey.shade800,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications action
            },
          ),
          const SizedBox(width: 10),
          ClipOval(
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: 
      ListView(
        children: [
             Column(
               children: [
                   SizedBox(
                     height: 80,
                     
                     child: ListView.builder( 
                     scrollDirection: Axis.horizontal,                      
                     itemCount: sportsOptions.length,
                     itemBuilder: (context, index) 
                       {
                         return TopRowButton(
                           name: sportsOptions[index]["name"]??"",
                           routeName: sportsOptions[index]["route"]??"",
                         );
                         },
                       ),
                   ),

                   
                   Container(
                    margin: EdgeInsets.all(10.0),
                     child: SizedBox(
                       height: 300,
                       width: 500,
                       child: ListView.builder(
                         scrollDirection: Axis.horizontal,
                         itemCount: sportsBanner.length,
                         itemBuilder: (context, index){
                           return 
                           Expanded(
                            child: BannerImageWidget(
                             image: sportsBanner[index]["image"]),
                             );
                             }
                          ), 
                       ),
                   ),
             
                   SizedBox(
                     height: 150,
                     child: 
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text("Explore"),
                         Text("See More"),
                       ],
                     ),
                   ),
               ],
             ),
   
        ],
      ),
  
    );
  }
}


