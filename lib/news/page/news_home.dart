import 'package:flutter/material.dart';
import 'package:my_app/news/widget/news_appbar_widget.dart';

// Represents the main home page displaying news categories, featured news, and the latest news list.
class NewsHomePage extends StatelessWidget {
  const NewsHomePage({super.key});

  // A list of news categories to display in the horizontal selector.
  static const List<String> _categories = ['All news', 'Business', 'Sports', 'Tech'];

  // The URL for the featured news image placeholder.
  static const String _featuredNewsImageUrl =
      'https://via.placeholder.com/400x250?text=Featured+News+Image';

  // The title of the featured news article.
  static const String _featuredNewsTitle = 'A ruggedly beautiful adventure life';

  // The heading text for the latest news section.
  static const String _latestNewsHeading = 'Latest news';

  // Padding used throughout the screen for better visual spacing.
  static const EdgeInsets _screenPadding = EdgeInsets.all(16.0);

  // Spacing between elements in the news item tile.
  static const SizedBox _tileHorizontalSpacing = SizedBox(width: 16);
  static const SizedBox _tileVerticalSpacing = SizedBox(height: 8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NewsAppBar(screenPadding: EdgeInsets.all(14),),
            _buildCategorySelector(),
            _buildFeaturedNewsCard(),
            _buildLatestNewsSection(),
            _buildNewsList(),
            _buildBottomNavigationBar(),
          ],
        ),
      ),
    );
  }

  // Builds the horizontal category selector.
  Widget _buildCategorySelector() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: _categories
            .map((category) => Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle category selection here
                      print('Selected category: $category');
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: category == _categories.first
                          ? Colors.white
                          : Colors.black,
                      backgroundColor: category == _categories.first
                          ? Colors.black
                          : Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(category),
                  ),
                ))
            .toList(),
      ),
    );
  }

  // Builds the featured news card at the top.
  Widget _buildFeaturedNewsCard() {
    return Padding(
      padding: _screenPadding,
      child: Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            image: NetworkImage(_featuredNewsImageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: const Stack(
          children: [
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Text(
                _featuredNewsTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Builds the heading for the latest news section.
  Widget _buildLatestNewsSection() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        _latestNewsHeading,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Builds the scrollable list of latest news items.
  Widget _buildNewsList() {
    return Expanded(
      child: ListView(
        padding: _screenPadding,
        children: const [
          NewsItemTile(
            imageUrl: 'https://via.placeholder.com/100x100?text=News+1',
            title: 'Awesome Trip Around the World',
            time: '4 hours ago',
          ),
          NewsItemTile(
            imageUrl: 'https://via.placeholder.com/100x100?text=News+2',
            title: 'The Best Philosophy Locations',
            time: '1 day ago',
          ),
          NewsItemTile(
            imageUrl: 'https://via.placeholder.com/100x100?text=News+3',
            title: 'Another Interesting Article',
            time: '2 days ago',
          ),
          NewsItemTile(
            imageUrl: 'https://via.placeholder.com/100x100?text=News+4',
            title: 'Breaking Development in Technology',
            time: '3 days ago',
          ),
        ],
      ),
    );
  }

  // Builds the bottom navigation bar.
  Widget _buildBottomNavigationBar() {
    return const Padding(
      padding: _screenPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.home, color: Colors.black, size: 30),
          Icon(Icons.bookmark_border, color: Colors.grey, size: 30),
          Icon(Icons.person_outline, color: Colors.grey, size: 30),
        ],
      ),
    );
  }
}

// Represents a single news item tile in the latest news list.
class NewsItemTile extends StatelessWidget {
  /// The URL of the image for this news item.
  final String imageUrl;

  /// The title of this news item.
  final String title;

  /// The time elapsed since this news item was published.
  final String time;

  const NewsItemTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          // News Image
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          NewsHomePage._tileHorizontalSpacing,
          // News Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                NewsHomePage._tileVerticalSpacing,
                Text(
                  time,
                  style: const TextStyle(
                    color: Colors.grey,
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