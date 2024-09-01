part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}

class FetchNewsEvent extends NewsEvent {
  FetchNewsEvent();
}

class AddTofav  extends NewsEvent{
  final NewsModel newsModel;

  AddTofav({required this.newsModel});
}
