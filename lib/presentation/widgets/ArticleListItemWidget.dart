


import 'package:flutter/material.dart';
import 'package:ny_times_most_pupulararticles/data/models/Article.dart';

class ArticleListItem extends StatelessWidget {
  Article article;

  ArticleListItem({@required this.article});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(backgroundColor: Colors.grey,backgroundImage: NetworkImage(article.mediaMetaDataList[2].url),),
          Expanded(child: buildTextWidget()),
          Icon(Icons.keyboard_arrow_right ,)

        ],

      ),
    );
  }

  Widget buildTextWidget(){
    return Column(
      children: <Widget>[
        Text(article.title , maxLines: 2,overflow: TextOverflow.ellipsis,),
        SizedBox(height: 8.0,),
        Text(article.description , maxLines: 1,overflow: TextOverflow.ellipsis,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(article.source),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.date_range),
                Text(article.date)
              ],
            )

          ],
        )


      ],
    );
  }




}
