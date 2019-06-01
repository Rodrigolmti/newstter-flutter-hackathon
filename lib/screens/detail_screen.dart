import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

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
        body: WebviewScaffold(
            url: url,
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
