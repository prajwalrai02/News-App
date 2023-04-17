// 1. Make N/w call
// 2. API gets hit
// 3. Grab the JSON
// 4. Convert Json to Object

import 'package:dio/dio.dart';
// "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=e52e420068884bcf9d07fe02e54b24e";

class Apiclient {
  Dio dio = Dio();

  Future<Response> get(url) {
    return dio.get(url);
  }

  post(data, url) {}
}
