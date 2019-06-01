import 'package:flutter/material.dart';
import 'package:newstter/data/news_repository.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final NewsRepository newsRepository = NewsRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }

  @override
  void initState() {
    super.initState();
    newsRepository.getFeedFromMedium().then((posts) {
      posts.forEach((post) =>   print(post.title));
    });
  }

  Widget _buildAppBar() =>
      PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 30),
        child: Container(
          color: Colors.red,
          child: SafeArea(
            child: Column(
              children: <Widget>[
                new Expanded(child: new Container()),
                TabBar(
                  tabs: [
                    Tab(
                      icon: Icon(Icons.book),
                      text: 'News',
                    ),
                    Tab(
                      icon: Icon(Icons.cast),
                      text: 'Recommendations',
                    ),
                    Tab(
                      icon: Icon(Icons.work),
                      text: 'Jobs',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // backgroundColor: Colors.red,
        // bottom:
      );

  Widget _buildBody() =>
      TabBarView(
        children: <Widget>[
          Column(
            children: <Widget>[Text("News Page")],
          ),
          Column(
            children: <Widget>[Text("Recommendations Page")],
          ),
          Column(
            children: <Widget>[Text("Jobs Page")],
          ),
        ],
      );
}
