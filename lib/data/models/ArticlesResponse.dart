


import 'package:ny_times_most_pupulararticles/data/models/Article.dart';
import 'package:ny_times_most_pupulararticles/data/models/BaseResponse.dart';

class ArticleResponse extends BaseModelResponse{


  String copyright;

  List<Article> articles;



  ArticleResponse(){

  }
  ArticleResponse.fromJson(Map map){
    this.copyright = map["copyright"];
    articles = (map["results"] as List).map((data)=>Article.fromJson(data)).toList();
  }

  @override
  BaseModelResponse buildModel(Map map) {
    this.copyright = map["copyright"];
    articles = (map["results"] as List).map((data)=>Article.fromJson(data)).toList();
    return this;
  }

}