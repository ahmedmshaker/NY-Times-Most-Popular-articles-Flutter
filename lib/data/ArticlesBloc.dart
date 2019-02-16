

import 'package:ny_times_most_pupulararticles/data/BlocProvider.dart';
import 'package:ny_times_most_pupulararticles/data/models/Article.dart';
import 'package:ny_times_most_pupulararticles/data/models/ArticlesResponse.dart';
import 'package:ny_times_most_pupulararticles/domain/ArticlesApiProvider.dart';
import 'package:rxdart/rxdart.dart';


class ArticlesBloc extends BlocBase{

  BehaviorSubject<List<Article>> _behaviorSubject =  new  BehaviorSubject();

  Observable<List<Article>> get articles => _behaviorSubject.stream;
  ArticleApiProvider _apiProvider = ArticleApiProvider();



  ArticlesBloc() {

      _apiProvider.getMovies().then((stream){
        stream.listen((data)=>_behaviorSubject.add(data.articles));
    });
  }




  @override
  void dispose() {
  }

}