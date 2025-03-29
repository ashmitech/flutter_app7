// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/news/widget/news_appbar_widget.dart';
import 'package:my_app/news/widget/news_category_widget.dart';
import 'package:my_app/news/widget/news_featured_image.dart';
import 'package:my_app/news/widget/news_latest_widget.dart';
import 'package:my_app/news/widget/latest_news_tile.dart';
import 'package:my_app/news/widget/news_bottom_navigation.dart';

const List<String> _categories = ['All news', 'Business', 'Sports', 'Tech', "Science"]; //list of categories in navigation bar
const EdgeInsets _screenPadding = EdgeInsets.all(16.0); // news padding throught the screen
const List<Map<String, String>> _latestNewsData = [
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
  get https => null; 
 // news tile vertical padding
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //top nav bar
            NewsAppBarWidget(screenPadding: _screenPadding),
            
            //news category list
            Padding(
              padding: const EdgeInsets.only(left: 16, right:16, bottom: 8.0),
              child: NewsCategoryWidget(
                // screenPadding:_screenPadding,
                categories:_categories,
                onCategorySelected: (selectedCategory) {
                  // Handle the selected category in NewsHomePage
                  print('Category selected in HomePage: $selectedCategory');
                },
              ),
            ),

            NewsFeaturedImage(
              title:"New Featured Image", 
              padding:EdgeInsets.all(16.0),
              imageUrl:  "assets/images/lake.jpg"),
            
            Padding(
              padding: _screenPadding,
              child: LatestNewsHeading(headingText: "Latest News"),
            ),

           Expanded(
              child: ListView.builder(
                padding: _screenPadding,
                itemCount: _latestNewsData.length, // Use the length of your data list
                itemBuilder: (BuildContext context, int index) {
                  final newsItem = _latestNewsData[index]; // Get the data for the current index
                  return NewsItemTile(
                    imageUrl: newsItem['imageUrl']!,
                    title: newsItem['title']!,
                    time: newsItem['time']!,
                  );
                },
              ),
            ),

            NewsBottomNavigation(),
          ],
        ),
      ),
    );
  }
  }