import 'package:flutter/material.dart';
import 'package:hack19/hack19.dart';
import 'package:newstter/screens/jobs/job_list_screen.dart';
import 'package:hack19/src/FeedItem.dart' show FeedItem;
import 'package:newstter/screens/News/news_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<FeedItem> jobs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Color(0xFFecf0f1),
      body: _buildBody(),
    );
  }

  @override
  void initState() {
    super.initState();
    // _getJobsPosts();
  }

  Widget _buildAppBar() => PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 30),
        child: Container(
          color: Colors.red,
          child: SafeArea(
            child: Column(
              children: <Widget>[
                new Expanded(child: new Container()),
                TabBar(
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.book),
                      text: 'News',
                    ),
                    Tab(
                      icon: Icon(Icons.favorite),
                      text: 'Favorites',
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
      );

  Widget _buildBody() => TabBarView(
        children: <Widget>[
          NewsScreen(),
          Column(
            children: <Widget>[Text("Recommendations Page")],
          ),
          Column(
            children: [JobList()],
          ),
        ],
      );

  void _getJobsPosts() async {
    final fetcher =
        FeedFetcher('"https://stackoverflow.com/jobs/feed?q=flutter"');
    final job = await fetcher.fetch();

    this.setState(() => {jobs = job.items});
  }
}
