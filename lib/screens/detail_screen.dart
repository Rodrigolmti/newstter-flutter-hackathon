import 'package:flutter/material.dart';
import 'package:hack19/src/FeedItem.dart' show FeedItem;
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class DetailScreen extends StatelessWidget {
  final FeedItem item;

  DetailScreen(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(item.title),
        ),
        body: WebviewScaffold(
            url: item.link,
            withZoom: true,
            withLocalStorage: true,
            hidden: true,
            initialChild: Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )));
  }
}
