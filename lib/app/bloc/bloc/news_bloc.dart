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
  NewsBloc() : super(NewsInitial()) {
    on<FetchNewsEvent>(_fetchNews);
  }

  Future<FutureOr<void>> _fetchNews(FetchNewsEvent event, Emitter<NewsState> emit) async {
    NewsModel? newsModel;
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
}
