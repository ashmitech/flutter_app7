import 'package:flutter/material.dart';
import 'package:my_app/news/models/article_model.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<StatefulWidget> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    // Retrieve the article object from arguments
    final article = ModalRoute.of(context)!.settings.arguments as Articles;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            //Background Image
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    article.urlToImage ?? "assets/images/pic1.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.skip_previous, color: Colors.white),
                        ),
                        Spacer(),
                        Icon(Icons.share, color: Colors.white),
                        SizedBox(width: 20),
                        Icon(Icons.bookmark, color: Colors.white),
                      ],
                    ),
                    Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article.author ?? "No Author",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),

                        Spacer(),
                        Icon(Icons.comment, color: Colors.white),
                        SizedBox(width: 20),
                        Icon(Icons.remove_red_eye, color: Colors.white),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10),
            Text(
              article.title ?? "No  Title",
              maxLines: 4,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              article.description ?? "No Description",
              maxLines: 5,
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
