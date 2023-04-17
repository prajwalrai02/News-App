class Article {
  late String title;
  late String urlToImage;
  late String url;

  Article({
    required this.title,
    required this.url,
    required this.urlToImage,
  });

  static Article fromJSON(dynamic map) {
    return Article(
        title: map['title'],
        urlToImage: map['urlToImage'] ??
            'https://pbs.twimg.com/profile_images/1108430392267280389/ufmFwzIn_400x400.png',
        url: map['url']);
  }
}
