

import 'package:flutter/material.dart';
import 'package:ny_times_most_pupulararticles/Constants.dart';
import 'package:ny_times_most_pupulararticles/data/models/Article.dart';

class ArticlesDetailsFragment extends StatefulWidget {
  Article article;
  ArticlesDetailsFragment({this.article});
  @override
  _ArticlesDetailsFragmentState createState() => _ArticlesDetailsFragmentState();
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
                    "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: Center(
          child: Text("Sample Text"),
        ),
      ),
    );
  }



}
