


import 'package:flutter/material.dart';
import 'package:ny_times_most_pupulararticles/data/models/Article.dart';
import 'package:ny_times_most_pupulararticles/presentation/ArticlesDetailsFragment.dart';

class ArticleListItem extends StatelessWidget {
  Article article;

  ArticleListItem({@required this.article});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ArticlesDetailsFragment(article: article,)));
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Container(
              width: 60.0,
                height: 60.0,
                margin:EdgeInsets.all(8.0),
                child: CircleAvatar(backgroundColor: Colors.grey,backgroundImage: NetworkImage(article.mediaMetaDataList[2].url),)),
            Expanded(child: buildTextWidget()),
            Icon(Icons.keyboard_arrow_right ,)

          ],

        ),
      ),
    );
  }

  Widget buildTextWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(article.title , maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black,fontSize: 18),),
        SizedBox(height: 8.0,),
        Text(article.description , maxLines: 1,overflow: TextOverflow.ellipsis,),
        SizedBox(height: 4,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(article.source , style: TextStyle(fontSize: 14.0),),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.date_range , size: 20,),
                Text(article.date , style: TextStyle(fontSize: 10.0),)
              ],
            )

          ],
        )


      ],
    );
  }




}
