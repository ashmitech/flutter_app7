import 'package:flutter/material.dart';
import 'package:my_app/news/services/api_service.dart';

class ThirdRowWidget extends StatefulWidget {
  const ThirdRowWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ThirdRowState();
}

class _ThirdRowState extends State<ThirdRowWidget> {
  int? selectedIndex;
  List<int> bookmarkedItems = []; // Store bookmarked item indexes

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Latest News", style: TextStyle(fontSize: 12)),
          SizedBox(height: 10),
          SizedBox(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: FutureBuilder(
                future: fetchArticles(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final article = snapshot.data![index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //Image with rounded rectangle border
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  "/details",
                                  arguments: article,
                                );
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15.0),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      article.urlToImage ??
                                          "assets/images/pic1.jpg",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    article.author ?? "No Author",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 1),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        article.publishedAt ?? "No Date",

                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (bookmarkedItems.contains(
                                              index,
                                            )) {
                                              bookmarkedItems.remove(
                                                index,
                                              ); //remove from bookmarks
                                            } else {
                                              bookmarkedItems.add(index);
                                            }
                                          });
                                        },
                                        child: Icon(
                                          Icons.bookmark,
                                          color:
                                              bookmarkedItems.contains(index)
                                                  ? Colors.red
                                                  : Colors.blueGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 30),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
