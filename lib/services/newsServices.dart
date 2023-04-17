import 'package:dio/dio.dart';
import 'package:newsapp/infra/services/apiClient.dart';
import 'package:newsapp/models/article.dart';

class NewsServices {
  Apiclient apiclient = Apiclient();

  Future<List<Article>> getArticle() async {
    Response response = await apiclient.get(
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=e52e420068884bcf9d07fe02e54b24ee');

    print('Response is');
    print(response.data.runtimeType);

    List<dynamic> list = response.data['articles'];
    List<Article> article = list.map((m) => Article.fromJSON(m)).toList();
    print(article);
    //print(article.runtimeType);

    return article;
  }
}
