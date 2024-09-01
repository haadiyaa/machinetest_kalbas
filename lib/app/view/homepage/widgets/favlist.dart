import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machinetest_kalbas/app/bloc/bloc/news_bloc.dart';
import 'package:machinetest_kalbas/app/resources/constants.dart';
import 'package:machinetest_kalbas/app/view/homepage/widgets/myslidablecard.dart';

class FavListWrapper extends StatelessWidget {
  const FavListWrapper({super.key, required this.size});
  final Size size;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(),
      child: FavList(size: size),
    );
  }
}

class FavList extends StatefulWidget {
  const FavList({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<FavList> createState() => _FavListState();
}

class _FavListState extends State<FavList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is FavouritesUpdatedState) {
          if (state.articles.isEmpty) {
            return Center(
              child: Text('No Favourites added!'),
            );
          }
          final articles = state.articles;
          return ListView.separated(
            padding: const EdgeInsets.all(10),
            separatorBuilder: (context, index) => Constants.height10,
            itemCount: articles.length,
            itemBuilder: (BuildContext context, int index) {
              return MySlidableCard(
                size: widget.size,
                index: index,
                newsModel: articles[index],
              );
            },
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.all(10),
          separatorBuilder: (context, index) => Constants.height10,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            // return MySlidableCard(size: widget.size, index: index);
          },
        );
      },
    );
  }
}
