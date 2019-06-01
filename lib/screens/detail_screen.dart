import 'package:flutter/material.dart';
import 'package:hack19/src/FeedItem.dart' show FeedItem;
import 'package:webview_flutter/webview_flutter.dart';

class DetailScreen extends StatelessWidget {

  final String title;
  final String url;

  DetailScreen(this.title, this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(title),
      ),
      body: WebView(
        key: UniqueKey(),
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: url,
      ),
    );
  }
}
