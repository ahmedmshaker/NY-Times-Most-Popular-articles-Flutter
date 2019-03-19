import 'package:flutter/material.dart';
import 'package:ny_times_most_pupulararticles/data/ArticlesBloc.dart';
import 'package:ny_times_most_pupulararticles/data/BlocProvider.dart';
import 'package:ny_times_most_pupulararticles/data/models/Article.dart';
import 'package:ny_times_most_pupulararticles/presentation/widgets/ArticleListItemWidget.dart';

class ListArticleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Article>>(
        stream: BlocProvider.of<ArticlesBloc>(context).articles,
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) =>
                    ArticleListItem(article: snapshot.data[index]));
          else
            return Container();
        }
    );
  }
}
