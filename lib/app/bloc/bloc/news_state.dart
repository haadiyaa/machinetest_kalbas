part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

final class NewsInitial extends NewsState {}

class NewsFetchedState extends NewsState {
  final NewsModel newsModel;

  NewsFetchedState({required this.newsModel});
}

class NewsLoading extends NewsState {}

class NewsFetchErrorState extends NewsState {
  final String msg;

  NewsFetchErrorState({required this.msg});
}

class FavouritesUpdatedState extends NewsState {
  final List<NewsModel> articles;

  FavouritesUpdatedState({required this.articles});
}
