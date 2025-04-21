import 'package:flutter/material.dart';
import 'package:my_app/news/widgets/first_row_widget.dart';
import 'package:my_app/news/widgets/second_row_widget.dart';
import 'package:my_app/news/widgets/third_row_widget.dart';
// import 'package:full_news_app/repository/network_request.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            FirstRowWidget(),
            SizedBox(height: 10),
            SecondRowWidget(),
            SizedBox(height: 10),
            ThirdRowWidget(),
          ],
        ),
      ],
    );
  }
}
