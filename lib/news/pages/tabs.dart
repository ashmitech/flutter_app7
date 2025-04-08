import 'package:flutter/material.dart';
import 'package:my_app/models/list_item_model.dart';
import 'package:my_app/news/pages/articles_details_page.dart';
import 'package:my_app/news/widget/list_widget.dart';

import 'package:dio/dio.dart';

class Articles extends StatefulWidget {
  final String? category;

  const Articles({super.key, this.category});

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  List<ListItem> listTiles = [
  ];

  @override
  void initState() {
    super.initState();
    NewsService.getNewsArticles(category: widget.category.toString()).then((value) {
      setState(() {
        listTiles = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: listTiles.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                            item: listTiles[index],
                            tag: listTiles[index].newsTitle,
                            key: null,
                          )));
            },
            child: listWidget(listTiles[index]),
          );
        },
      ),
    );
  }
}

class NewsService {
  static Dio dio = Dio();

  static Future<List<ListItem>> getNewsArticles(
      {String category = 'general'}) async {
    Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=1454be59e08346aab3eec78a66d56a70');
    List<dynamic> list = response.data['articles'];
    List<ListItem> newsArticles = list
        .map((e) =>
            ListItem(e['urlToImage']??'',e['title'],'', e['publishedAt'],e['content']??'',e['description']??''))
        .toList();
    return newsArticles;
  }
}
