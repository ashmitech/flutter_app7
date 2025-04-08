import 'package:flutter/material.dart';
import 'package:my_app/news/pages/tabs.dart';

class NewsHomePage extends StatefulWidget {
  const NewsHomePage({super.key});

  @override
  State<NewsHomePage> createState() => _NewsHomePageState();
}

class _NewsHomePageState extends State<NewsHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Tab> categoryTabs = const [
    Tab(text: 'General'),
    Tab(text: 'Entertainment'),
    Tab(text: 'Business'),
    Tab(text: 'Health'),
    Tab(text: 'Science'),
    Tab(text: 'Sports'),
    Tab(text: 'Technology'),
  ];

  @override
  void initState() {
    _tabController = TabController(length: categoryTabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(
            Icons.search,
          ),
          Icon(Icons.notifications)
        ],
        title: const Text('NewsApp'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: TabBar(
            controller: _tabController,
            tabs: categoryTabs,
            isScrollable: true,
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Articles(category: 'general'),
          Articles(category: 'entertainment'),
          Articles(category: 'business'),
          Articles(category: 'health'),
          Articles(category: 'science'),
          Articles(category: 'sports'),
          Articles(category: 'technology'),
        ],
      ),
    );
  }
}