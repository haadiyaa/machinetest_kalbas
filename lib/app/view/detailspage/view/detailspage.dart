import 'package:flutter/material.dart';
import 'package:machinetest_kalbas/app/model/newsmodel.dart';
import 'package:machinetest_kalbas/app/resources/constants.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.newsModel, required this.index});

  final NewsModel newsModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Row(
            children: [
              Icon(Icons.chevron_left_sharp),
              Text('Back'),
            ],
          ),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: size.width * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    // width: size.width * 0.9,
                    height: size.height * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(newsModel
                                .articles[index].urlToImage ??
                            'https://thumbs.dreamstime.com/b/news-network-mobile-device-89835976.jpg'),
                            fit: BoxFit.cover
                      ),
                    ),
                  ),
                  const Positioned(
                    right: 10,
                    top: 10,
                    child: Icon(Icons.favorite_border,color: Constants.black,),
                  ),
                ],
              ),
              Constants.height5,
              Text(
                newsModel.articles[index].title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
               Row(
                children: [
                  const Icon(
                    Icons.calendar_month,
                    size: 18,
                    color: Constants.grey,
                  ),
                  Text(
                    newsModel.articles[index].publishedAt.toString(),
                    style: const TextStyle(
                      color: Constants.grey,
                    ),
                  ),
                ],
              ),
              Constants.height10,
              Text(newsModel.articles[index].content),
            ],
          ),
        ),
      ),
    );
  }
}
