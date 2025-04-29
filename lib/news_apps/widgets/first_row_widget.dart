import 'package:flutter/material.dart';
import 'package:my_app/news_apps/models/article_model.dart';
import 'package:my_app/news_apps/services/api_service.dart';

class FirstRowWidget extends StatefulWidget {
  const FirstRowWidget({super.key});
  
  @override
  State<StatefulWidget> createState() => _FirstrowWidgetState();
}

class _FirstrowWidgetState extends State<FirstRowWidget> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 5.0),
        child: SizedBox(
          height: 30,
          child: FutureBuilder<List<Articles>>(
            future: fetchArticles(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final article = snapshot.data![index];
                    return MouseRegion(
                      //Detect mouse hovers
                      onEnter:
                          (_) => setState(
                            () => selectedIndex = index,
                          ), //Highlight on hover
                      onExit:
                          (_) => setState(
                            () => selectedIndex = null,
                          ), //remove highlight when not hover
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            Navigator.pushNamed(context, "/news_details");
                            // Set selected index on click
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: ((selectedIndex == null && index == 0) || selectedIndex == index)
                                    ? Colors.blue.shade700
                                    : Colors.transparent,
                                width: 2.0,
                              ),
                            ),
                          ),

                          child: Text(
                            article.author ?? "No Author",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 15);
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
