import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hack19/hack19.dart';
import 'package:hack19/src/FeedItem.dart' show FeedItem;
import 'package:newstter/data/database.dart';
import 'package:newstter/screens/detail_screen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen() : super();

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<FeedItem> articles = [];
  List<FeedItem> favorites = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getNews();
    _getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? _getLoadingWidget() : _buildBody();
  }

  Widget _buildBody() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return _newsCard(
              articles[index],
              favorites.where((x) => x.link == articles[index].link).isNotEmpty,
            );
          },
        ),
      );

  Widget _newsCard(FeedItem item) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(item.title, item.link),
            ),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: item.image != null && item.image.isNotEmpty
                    ? Image.network(
                        item.image,
                        fit: BoxFit.contain,
                        height: 200,
                      )
                    : Image(
                        height: 200,
                        fit: BoxFit.contain,
                        image: AssetImage(
                          _getImagePath(item.link),
                        ),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      _getPostOrigin(item.link),
                      style: TextStyle(
                        fontSize: 11.0,
                        color: _getPostOriginColor(item.link),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        if (favorited) {
                          DBProvider.db.deleteFavoriteByLink(item.link);
                        } else {
                          DBProvider.db.addFavoriteFeed(item);
                        }
                      },
                      padding: EdgeInsets.all(0.0),
                      child: Container(
                        child: Icon(
                          favorited ? Icons.favorite : Icons.favorite_border,
                          color: favorited ? Colors.red : Colors.blueGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _getLoadingWidget() => Center(child: CircularProgressIndicator());

  void _getNews() {
    _getMediumPosts();
    _getMediumFlutterCommunity();
    _getMediumDartLang();
    _getStackoverflowFlutter();
    _getStackoverflowDart();
    _getGitHubPullIssues();
    _getGitHubPullRequests();
    this.setState(() => {
          isLoading = false,
        });
  }

  void _fetchItems(String url) async {
    final fetcher = FeedFetcher(url);
    final feed = await fetcher.fetch();

    this.setState(() => {
          articles.addAll(feed.items),
          // articles.shuffle(),
        });
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

  void _getGitHubPullRequests() {
    _fetchItems('http://pullfeed.co/feeds/flutter/flutter');
  }

  void _getGitHubPullIssues() {
    _fetchItems('https://rsshub.app/github/issue/flutter/flutter');
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

  Color _getPostOriginColor(String url) {
    final postOrigin = _getPostOrigin(url);

    switch (postOrigin) {
      case 'Medium':
        return Colors.green;
      case 'Stack Overflow':
        return Colors.orange;
      case 'GitHub':
        return Colors.blueAccent;
      default:
        return Colors.black;
    }
  }

  void _getFavorites() async {
    final list = await DBProvider.db.getAllFavorites();
    print(list);
    this.setState(() => {
          favorites = list,
        });
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
