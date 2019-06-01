import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hack19/hack19.dart';
import 'package:hack19/src/FeedItem.dart' show FeedItem;
import 'package:newstter/data/database.dart';
import 'package:newstter/screens/detail_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen() : super();

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<FeedItem> articles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
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
                  right: 16.0,
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _getLoadingWidget() => Center(child: CircularProgressIndicator());

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
    this.setState(() => {
          articles = list,
          isLoading = false,
        });
  }
}
