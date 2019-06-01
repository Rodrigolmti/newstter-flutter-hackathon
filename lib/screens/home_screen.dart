import 'package:flutter/material.dart';
import 'package:hack19/hack19.dart';
import 'package:hack19/src/FeedItem.dart' show FeedItem;

import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<FeedItem> articles = [];
  List<FeedItem> jobs = [];

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

    _getNews();
    _getJobsPosts();
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return _newsCard(
                  articles[index],
                );
              },
            ),
          ),
          Column(
            children: <Widget>[Text("Recommendations Page")],
          ),
          Column(
            children: <Widget>[Text("Jobs Page")],
          ),
        ],
      );

  Widget _newsCard(FeedItem item) => GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DetailScreen()));
        },
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              item.image != null && item.image.isNotEmpty
                  ? Image.network(
                      item.image,
                      fit: BoxFit.cover,
                    )
                  : Image(
                      image: AssetImage(
                        _getImagePath(item.link),
                      ),
                    ),
              // : Image(
              //     _getImagePath(item.link),
              //   ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 8.0,
                ),
                child: Text(
                  _getPostOrigin(item.link),
                  style: TextStyle(
                    fontSize: 11.0,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(item.title),
              ),
            ],
          ),
        ),
      );

  void _fetchItems(String url) async {
    final fetcher = FeedFetcher(url);
    final feed = await fetcher.fetch();

    this.setState(() => {
          articles.addAll(feed.items),
        });
  }

  void _getNews() {
    _getMediumPosts();
    _getMediumFlutterCommunity();
    _getMediumDartLang();
    _getStackoverflowFlutter();
    _getStackoverflowDart();
  }

  void _getMediumPosts() {
    _fetchItems('https://medium.com/feed/flutter');
  }

  void _getMediumFlutterCommunity() {
    _fetchItems('https://medium.com/feed/flutter-community');
  }

  void _getMediumDartLang() {
    _fetchItems('https://medium.com/feed/dartlang');
  }

  void _getStackoverflowFlutter() {
    _fetchItems('https://stackoverflow.com/feeds/tag/flutter');
  }

  void _getStackoverflowDart() {
    _fetchItems('https://stackoverflow.com/feeds/tag/dart');
  }

  void _getJobsPosts() async {
    final fetcher =
        FeedFetcher('"https://stackoverflow.com/jobs/feed?q=flutter"');
    final job = await fetcher.fetch();

    this.setState(() => {jobs = job.items});
  }

  String _getImagePath(String url) {
    final postOrigin = _getPostOrigin(url);

    switch (postOrigin) {
      case 'Medium':
        return 'assets/medium.jpeg';
      case 'Stack Overflow':
        return 'assets/stack_overflow.png';
      case 'GitHub':
        return 'assets/github.jpg';
      default:
        return 'assets/medium.jpeg';
    }
  }

  String _getPostOrigin(String url) {
    if (url.contains('medium')) {
      return 'Medium';
    } else if (url.contains('stackoverflow')) {
      return 'Stack Overflow';
    } else if (url.contains('github')) {
      return 'GitHub';
    }

    return 'None';
  }
}
