import 'package:flutter/material.dart';
import 'package:machinetest_kalbas/app/resources/constants.dart';
import 'package:machinetest_kalbas/app/resources/styles.dart';
import 'package:machinetest_kalbas/app/view/homepage/widgets/favlist.dart';
import 'package:machinetest_kalbas/app/view/homepage/widgets/myslidablecard.dart';
import 'package:machinetest_kalbas/app/view/homepage/widgets/newslist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: TabBar(
          dividerColor: Constants.transparent,
          unselectedLabelColor: Constants.black,
          labelColor: Constants.black,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          indicator: BoxDecoration(
            color: Constants.lightblue,
            borderRadius: BorderRadius.circular(8),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.list),
                  Constants.width5,
                  Text(
                    'News',
                    style: Styles.tabHead,
                  )
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite,
                    color: Constants.red,
                  ),
                  Constants.width5,
                  Text('Favs')
                ],
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          NewsListWrapper(size: size),
          FavList(size: size),
        ],
      ),
    );
  }
}
