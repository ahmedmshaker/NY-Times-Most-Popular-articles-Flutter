


import 'package:ny_times_most_pupulararticles/data/models/MediaMetaData.dart';

class Article{

  String title;
  String description;
  String date;
  String writtenBy;
  String source;
  List<MediaMetaData> mediaMetaDataList;


  Article.fromJson(Map map){
    this.description = map["abstract"];
    this.title = map["title"];
    this.date = map["published_date"];
    this.source = map["source"];
    this.writtenBy = map["byline"];
    this.mediaMetaDataList = ((map["media"] as List)[0]["media-metadata"] as List).map((data)=>MediaMetaData.fromJson(data)).toList();
  }

}