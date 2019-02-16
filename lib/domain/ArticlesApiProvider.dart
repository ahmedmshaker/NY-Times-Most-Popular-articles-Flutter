import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ny_times_most_pupulararticles/Constants.dart';
import 'package:ny_times_most_pupulararticles/data/models/ArticlesResponse.dart';


class ArticleApiProvider {
  final client = http.Client();


  Future<Stream<ArticleResponse>> getMovies() async {
    var request = http.Request("get" , Uri.parse(ARTICLES_URL));
    var streamResponse = await client.send(request);
    //if(streamResponse.statusCode == 200){
     return streamResponse.stream
          .transform(utf8.decoder)
          .transform(json.decoder)
          .map((map)=>ArticleResponse.fromJson(map));

  }
}
