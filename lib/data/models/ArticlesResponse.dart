


import 'package:ny_times_most_pupulararticles/data/models/Article.dart';

class ArticleResponse{


  String copyright;

  List<Article> articles;

  ArticleResponse.fromJson(Map map){
    this.copyright = map["copyright"];
    articles = (map["results"] as List).map((data)=>Article.fromJson(data)).toList();
  }

}