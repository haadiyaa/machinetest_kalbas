
import 'package:flutter/material.dart';
import 'package:machinetest_kalbas/app/resources/constants.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({
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
        return Shimmer.fromColors(
          baseColor: const Color.fromARGB(255, 226, 226, 226),
          highlightColor: Constants.white,
          child: Container(
            height: size.height * 0.18,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
            color: Constants.black,
            borderRadius: BorderRadius.circular(18)
            ),
          ),
        );
      },
    );
  }
}
