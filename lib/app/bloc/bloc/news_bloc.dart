import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:machinetest_kalbas/app/model/newsmodel.dart';
import 'package:machinetest_kalbas/app/repositories/apirepository.dart';
import 'package:meta/meta.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final ApiRepository _apiRepository=ApiRepository();
  List<NewsModel> _favourites=[];
  NewsBloc() : super(NewsInitial()) {
    on<FetchNewsEvent>(_fetchNews);
    on<AddTofav>(_addtoFav);
  }

  Future<FutureOr<void>> _fetchNews(FetchNewsEvent event, Emitter<NewsState> emit) async {
    NewsModel? newsModel;
    emit(NewsLoading());
    try {
      final Response response=await _apiRepository.fetchNews();
      print('status: ${response.statusCode}');
      print(response.body);
      final data=jsonDecode(response.body);
      print('response: $data');
      if (response.statusCode==200) {
        newsModel=NewsModel.fromJson(data);
        emit(NewsFetchedState(newsModel: newsModel));
      } else {
        emit(NewsFetchErrorState(msg: data['message']));
      }
    } catch (e) {
      print('error');
      print(e.toString());
       emit(NewsFetchErrorState(msg: e.toString()));
    }
  }

  FutureOr<void> _addtoFav(AddTofav event, Emitter<NewsState> emit) {
    _favourites.add(event.newsModel);
    emit(FavouritesUpdatedState(articles: _favourites));
  }
}
