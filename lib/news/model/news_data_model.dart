class NewsDataModel {
  String title;
  String description;
  String image;
  String publishedAt;
  String ?author="Anonymous";
  String ?activeReader="1.5 M";

  NewsDataModel({
    required this.title,
    required this.description,
    required this.publishedAt,
    required this.image,
    this.author,
    this.activeReader,
  });
}

