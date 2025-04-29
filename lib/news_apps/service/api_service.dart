import 'package:dio/dio.dart';
import 'package:my_app/news_apps/models/article_model.dart';

Future<List<Articles>> fetchArticles() async {
  try {
    final response = await Dio().get(
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=6d1d37bcbdbf478da80c1b55b9f4a4f3"
    );
    print("Response Status Code: ${response.statusCode}");
    print("Response Data: ${response.data}");
    if (response.statusCode == 200) {
      List<dynamic> articlesJson = response.data['articles'];
      print(response);
      return articlesJson.map((json) => Articles.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load articles");
    }
  } catch (e) {
    throw Exception("Error:$e");
  }
}
