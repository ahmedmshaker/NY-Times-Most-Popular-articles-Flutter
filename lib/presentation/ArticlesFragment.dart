import 'package:flutter/material.dart';
import 'package:ny_times_most_pupulararticles/Constants.dart';
import 'package:ny_times_most_pupulararticles/data/ArticlesBloc.dart';
import 'package:ny_times_most_pupulararticles/data/BlocProvider.dart';
import 'package:ny_times_most_pupulararticles/presentation/ListArticleScreen.dart';

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
          appBar: AppBar(
            title: Text(APPBAR_TITLE),
          ),
          body: ListArticleScreen()),
    );
  }
}
