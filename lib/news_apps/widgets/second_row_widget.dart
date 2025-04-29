import 'package:flutter/material.dart';
import 'package:my_app/news_apps/services/api_service.dart';

class SecondRowWidget extends StatefulWidget {
  const SecondRowWidget({super.key});

  @override
  State<StatefulWidget> createState() => _SecondRowState();
}

class _SecondRowState extends State<SecondRowWidget> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
      child: SizedBox(
        height: 200,
        child: FutureBuilder(
          future: fetchArticles(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemCount: 10,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final article = snapshot.data![index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "/news-details",
                        arguments: article,
                      );
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: 400,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                              image:
                                  article.urlToImage != null
                                      ? NetworkImage(article.urlToImage!)
                                      : AssetImage("assets/images/pic1.jpg")
                                          as ImageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                article.author ?? "No Author",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                                maxLines: 4,
                              ),
                            ),
                            SizedBox(height: 8),
                            SizedBox(
                              width: 300,
                              child: Text(
                                article.title ?? "No Title",
                                style: TextStyle(
                                  fontSize: 8,
                                  color: Colors.white,
                                ),
                                maxLines: 50,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
