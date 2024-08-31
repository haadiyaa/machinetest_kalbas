import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:machinetest_kalbas/app/model/newsmodel.dart';
import 'package:machinetest_kalbas/app/resources/constants.dart';
import 'package:machinetest_kalbas/app/view/detailspage/view/detailspage.dart';

class MySlidableCard extends StatelessWidget {
  const MySlidableCard({
    super.key,
    required this.size,
    required this.index,
    required this.newsModel,
  });

  final Size size;
  final int index;
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            spacing: 8,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            key: ValueKey(index),
            flex: 1,
            onPressed: (_) {},
            backgroundColor: Colors.red.shade100,
            foregroundColor: Constants.red,
            icon: Icons.favorite,
            label: 'Add to Favourites',
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const DetailsPage()));
        },
        child: Card(
          elevation: 10,
          child: Container(
            // width: size.width*0.9,
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: size.width * 0.25,
                  width: size.width * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(
                        newsModel.articles[index].urlToImage ??
                            'https://thumbs.dreamstime.com/b/news-network-mobile-device-89835976.jpg',
                      ),
                      fit: BoxFit.cover
                    ),
                  ),
                ),
                Constants.width10,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        newsModel.articles[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        newsModel.articles[index].content,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            size: 18,
                            color: Constants.grey,
                          ),
                          Constants.width5,
                          Text(
                            newsModel.articles[index].publishedAt.toString(),
                            style:
                                TextStyle(color: Constants.grey, fontSize: 14),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
