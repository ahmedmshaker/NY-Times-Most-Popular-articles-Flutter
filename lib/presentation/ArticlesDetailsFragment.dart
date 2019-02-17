import 'package:flutter/material.dart';
import 'package:ny_times_most_pupulararticles/Constants.dart';
import 'package:ny_times_most_pupulararticles/data/models/Article.dart';

class ArticlesDetailsFragment extends StatefulWidget {
  Article article;

  ArticlesDetailsFragment({@required this.article});

  @override
  _ArticlesDetailsFragmentState createState() =>
      _ArticlesDetailsFragmentState();
}

class _ArticlesDetailsFragmentState extends State<ArticlesDetailsFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    title: Text(APPBAR_TITLE,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: Image.network(
                      widget.article.mediaMetaDataList[4].url,
                      fit: BoxFit.cover,
                    )),
              ),
            ];
          },
          body: buildBody()),
    );
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        Text(widget.article.title,
            style: TextStyle(color: Colors.black, fontSize: 18)),
        SizedBox(
          height: 16,
        ),
        Text(widget.article.description, style: TextStyle(fontSize: 16)),
        SizedBox(
          height: 8,
        ),
        buildCreatedByRow(CREATED_BY, widget.article.writtenBy),
        SizedBox(
          height: 4,
        ),
        buildCreatedByRow(SOURCE, widget.article.source)
      ],
    );
  }

  Widget buildCreatedByRow(String title, String description) {
    return Row(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(color: Colors.green, fontSize: 18),
        ),
        Text(
          description,
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
