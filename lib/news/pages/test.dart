import 'package:flutter/material.dart';
class NewsTestPage extends StatefulWidget {
  const NewsTestPage({super.key});
  @override
  State<NewsTestPage> createState() => _NewsTestPageState();
}
class _NewsTestPageState extends State<NewsTestPage> {
  int num= 0;
  bool click= true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          Column(
            children: [
              ElevatedButton(onPressed: (){
              },
              child: Text('TestData')),
            ],            
          ),
          Divider(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){
                  setState(() {
                  });
                },
                child: Icon((click=!click)
                ?Icons.bookmark_add_outlined
                :Icons.bookmark,color: Colors.black,
                ),
              ),
            ],
          ),
          Divider(),
          Column(
            children: [
              ElevatedButton(onPressed: (){
              },
               child: Text('Number'))
            ],
          ),
          Divider(),
      ],
    );
  }
}