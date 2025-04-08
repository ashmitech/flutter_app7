import 'package:flutter/material.dart';
import 'package:my_app/news/model/news_data_model.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({super.key});

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    final newsDataModel= ModalRoute.of(context)!.settings.arguments as NewsDataModel;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color:Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              image: DecorationImage(
                image: NetworkImage(
                  newsDataModel.urlToImage
                ),
                fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          autofocus: true,
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.skip_previous, color:Colors.white),
                        ),
                        Spacer(),
                        Icon(Icons.share, color:Colors.white),
                        SizedBox(width:20),
                        Icon(Icons.bookmark, color:Colors.white),  
                      ],
                    ),
                    Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          newsDataModel.author??"No Author",
                          style: TextStyle(fontSize: 18, color:Colors.white),
                        ),
                        Spacer(),
                        Icon(Icons.comment, color:Colors.white),
                        SizedBox(width: 20,),
                        Icon(Icons.remove_red_eye, color: Colors.white,),
                      ],
                      ),
                  ],
                ),
                ),
              ),

              SizedBox(height:10),
              Text(
                newsDataModel.title,
                maxLines: 4,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color:Colors.black,
                ),
              ),
              SizedBox(height:10),
              Text(
                newsDataModel.description,
                maxLines: 5,
                style: TextStyle(fontSize:18, color: Colors.black),
              ),

          ],
        ),
      ),
    );
  }
}