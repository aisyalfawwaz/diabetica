class News {
  final String title;
  final String urlToImage;

  News({required this.title, required this.urlToImage});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'] ?? 'No title',
      urlToImage: json['urlToImage'] ?? '',
    );
  }
}
