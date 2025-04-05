class NewsDataModel {
  String title;
  String description;
  String urlToImage;
  String publishedAt;
  String ?author="Anonymous";
  String ?activeReader="1.5 M";

  NewsDataModel({
    required this.title,
    required this.description,
    required this.publishedAt,
    required this.urlToImage,
    this.author,
    this.activeReader,
  });
}

