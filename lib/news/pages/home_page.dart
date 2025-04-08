import 'package:flutter/material.dart';
// import 'package:my_app/news/model/news_data_model.dart';
import 'package:my_app/news/widget/news_appbar_widget.dart';
import 'package:my_app/news/widget/news_category_widget.dart';
import 'package:my_app/news/widget/news_featured_image.dart';
import 'package:my_app/news/widget/news_latest_widget.dart';
import 'package:my_app/news/widget/latest_news_tile.dart';
import 'package:my_app/news/widget/news_bottom_navigation.dart';

// const List<String> _categories = ['All news', 'Business', 'Sports', 'Tech', "Science"]; //list of categories in navigation bar
const List<Map<String, dynamic>> _latestNewsData = [
  {
    'imageUrl': 'assets/images/lake.jpg',
    'title': 'Awesome Trip Around the World',
    'time': '4 hours ago',
  },
  {
    'imageUrl': 'assets/images/lake.jpg',
    'title': 'The Best Philosophy Locations',
    'time': '1 day ago',
  },
  {
    'imageUrl': 'assets/images/lake.jpg',
    'title': 'Another Interesting Article',
    'time': '2 days ago',
  },
  {
    'imageUrl': 'assets/images/lake.jpg',
    'title': 'Breaking Development in Technology',
    'time': '3 days ago',
  },
];

class NewsHomePage extends StatefulWidget {
  const NewsHomePage({super.key});

  @override
  State<NewsHomePage> createState() => _NewsHomePageState();
}

class _NewsHomePageState extends State<NewsHomePage> {
  // int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NewsAppBarWidget(),
            NewsCategoryWidget(),
            
            // Container with fixed height for horizontal ListView
            SizedBox(
              height: 200, // Adjust height as needed
              child: FeaturedNewsImage(
              // imageUrl: "assets/images/lake.jpg",
              imageUrl: 'https://cdn.pixabay.com/photo/2018/04/26/16/31/marine-3352341_1280.jpg',
              title: "Beautiflul lake",
              padding: EdgeInsets.all(16)),
            
            ),
            
            // Latest News heading
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
              child: LatestNewsHeading(headingText: "Latest News"),
            ),
            
            // Latest News list - vertical scrolling
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: _latestNewsData.length,
                itemBuilder: (BuildContext context, int index) {
                  return NewsItemTile(
                    imageUrl: _latestNewsData[index]['imageUrl']??'',
                    title: _latestNewsData[index]['title']??'No Title',
                    time: _latestNewsData[index]['time']??'',
                  );
                },
              ),
            ),
            
            // Bottom navigation
            const NewsBottomNavigation(),
          ],
        ),
      ),
    );
  }
}