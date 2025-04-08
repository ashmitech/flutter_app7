import 'package:flutter/material.dart';
import 'package:my_app/data/page/data_page.dart';

class DocumentScreen extends StatelessWidget {
  final Document document;
  const DocumentScreen({
    super.key,
    required this.document});
  
  @override
  Widget build(BuildContext context) {
    final metadataRecord = document.metadata;    

    return Scaffold(
      appBar: AppBar(
        title: Text(metadataRecord.$1),
        centerTitle: true,
        backgroundColor: Colors.red[500],
        foregroundColor: Colors.white,
      ),
      body:Column(
        children: [
          Center(
            child:Text(
              'Last modified ${metadataRecord.modified}',
            ),
          ),
        ],
      ),
    );
  }
}