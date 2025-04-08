
import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'data.dart';

class Document{
  // final Map<String, Object?> _json;
  // Document():_json=jsonDecode(documentJson);

 
  (String, {DateTime modified}) get metadata{
    const title ='My Document';
    final now = DateTime.now();
    return(title, modified:now);
  }
}
const documentJson = '''
{
  "metadata": {
    "title": "My Document",
    "modified": "2023-05-10"
  },
  "blocks": [
    {
      "type": "h1",
      "text": "Chapter 1"
    },
    {
      "type": "p",
      "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    },
    {
      "type": "checkbox",
      "checked": false,
      "text": "Learn Dart 3"
    }
  ]
}
''';


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

