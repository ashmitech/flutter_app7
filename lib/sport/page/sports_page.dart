import 'package:flutter/material.dart';
import 'package:my_app/sport/widget/sport_widget.dart';

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

final List<Map<String, String>> sportsBannerOptions = [
      {
        "title": "Kebin on strike",
        "subtitle":"kevin on strike on ucl final", 
        "route": '/kevin_debruina',
        "photo":"assets/images/banner.jpg",
        "autor":"Ram",
        "followers":"1.5M"
       },
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
             SafeArea(
        child: 
        Column(
          children: [
              SizedBox(
                height: 150,
                child: ListView.builder( 
                scrollDirection: Axis.horizontal, 
                
                padding: const EdgeInsets.symmetric(vertical: 2),
                itemCount: sportsOptions.length,
                itemBuilder: (context, index) 
                  {
                    return 
                      TopRowButton(
                        name: sportsOptions[index]["name"]!,
                        routeName: sportsOptions[index]["route"]!,
                      );
                    },
                  ),
              ),

              SizedBox(
                height: 300,
                child: BannerImageWidget(image: "assets/images/banner.jpg" )
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
      ),
   
        ],
      ),
  
    );
  }
}


