class NewsDataModel{
  final String? author;
  final String? title;
  final String? description;
  final String? urlToImage;
  final String? publishedAt;

NewsDataModel(
  {
    this.author,
    this.title,
    this.description,
    this.urlToImage,
    this.publishedAt,
  }
);

factory NewsDataModel.fromJson(Map<String, dynamic> json){
  return NewsDataModel(
    author: json['author'],
    title: json['title'],
    description: json['description'],
    urlToImage: json['urlToImage'],
    publishedAt: json['publishedAt'],
  );
}
}