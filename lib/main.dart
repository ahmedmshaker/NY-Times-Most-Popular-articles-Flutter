import 'package:flutter/material.dart';
import 'package:ny_times_most_pupulararticles/presentation/ArticlesFragment.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ArticleFragment(),
    );
  }
}

