import 'package:flutter/material.dart';
import 'package:ny_times_most_pupulararticles/Constants.dart';
import 'package:ny_times_most_pupulararticles/data/ArticlesBloc.dart';
import 'package:ny_times_most_pupulararticles/data/BlocProvider.dart';
import 'package:ny_times_most_pupulararticles/data/models/Article.dart';
import 'package:ny_times_most_pupulararticles/presentation/widgets/ArticleListItemWidget.dart';

class ArticleFragment extends StatefulWidget {
  @override
  ArticleFragmentState createState() {
    return new ArticleFragmentState();
  }
}

class ArticleFragmentState extends State<ArticleFragment> {
  ArticlesBloc articleBloc;

  @override
  void initState() {
    super.initState();
    articleBloc = ArticlesBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArticlesBloc>(
      bloc: articleBloc,
      child: Scaffold(
        appBar: AppBar(title: Text(APPBAR_TITLE),),
        body: StreamBuilder<List<Article>>(
            stream: articleBloc.articles,
            builder: (context, snapshot) {
              if (snapshot.hasData)
                return ListView.builder(
                  itemCount: snapshot.data.length,
                    itemBuilder: (context, index) =>
                        ArticleListItem(article: snapshot.data[index]));
              else
                return Container();
            }),
      ),
    );
  }
}
