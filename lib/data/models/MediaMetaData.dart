


class MediaMetaData{




  String url;
  int width;
  int height;
  String format;
  MediaMetaData.fromJson(Map map){
    this.url = map["url"];
    this.height = map["height"];
    this.width = map["width"];
    this.format = map["format"];
  }


}