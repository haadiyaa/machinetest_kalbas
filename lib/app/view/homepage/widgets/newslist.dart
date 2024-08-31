import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machinetest_kalbas/app/bloc/bloc/news_bloc.dart';
import 'package:machinetest_kalbas/app/model/newsmodel.dart';
import 'package:machinetest_kalbas/app/resources/constants.dart';
import 'package:machinetest_kalbas/app/view/homepage/widgets/myslidablecard.dart';
import 'package:machinetest_kalbas/app/view/homepage/widgets/shimmercard.dart';

class NewsListWrapper extends StatelessWidget {
  const NewsListWrapper({super.key, required this.size});
  final Size size;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(),
      child: NewsList(size: size),
    );
  }
}

class NewsList extends StatefulWidget {
  const NewsList({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  late NewsModel newsModel;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewsBloc>(context).add(FetchNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsFetchedState) {
          newsModel = state.newsModel;
          return ListView.separated(
            padding: const EdgeInsets.all(10),
            separatorBuilder: (context, index) => Constants.height10,
            itemCount: newsModel.articles.length,
            itemBuilder: (BuildContext context, int index) {
              return MySlidableCard(
                size: widget.size,
                index: index,
                newsModel: newsModel,
              );
            },
          );
        }
        return ShimmerCard(size: size);
      },
    );
  }
}
