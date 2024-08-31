import 'package:flutter/material.dart';
import 'package:machinetest_kalbas/app/resources/constants.dart';
import 'package:machinetest_kalbas/app/view/homepage/widgets/myslidablecard.dart';

class FavList extends StatelessWidget {
  const FavList({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(10),
      separatorBuilder: (context, index) => Constants.height10,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        // return MySlidableCard(size: size, index: index);
      },
    );
  }
}
