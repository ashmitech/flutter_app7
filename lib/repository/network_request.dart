import 'package:dio/dio.dart';
import 'package:my_app/news/model/news_data_model.dart';

Future<List<NewsDataModel>> fetchNewsData() async{
  try{
    final response=await Dio().get(
      "https://saurav.tech/NewsAPI/top-headlines/category/health/in.json",
    );
    print("Response Status Code: ${response.statusCode}");
    print("Response Data: ${response.data}");
    if(response.statusCode==200){
      List<dynamic> newsDataJson =response.data['NewsData'];
      print(response);
      return newsDataJson.map((json)=>NewsDataModel.fromJson(json)).toList();
    }else{
      throw Exception("Failed to load articles");
    }
  }catch(e){
    throw Exception("Error:$e");
  }
}