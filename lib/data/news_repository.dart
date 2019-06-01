import 'package:http/http.dart' as http;
import 'models/medium_response.dart';
import 'dart:convert';
import 'dart:async';

abstract class NewsRepository {
  Future<List<Post>> getFeedFromMedium();

  Future<Map> getFeedFromGithub();
}

class NewsRepositoryImpl implements NewsRepository {
  @override
  Future<Map> getFeedFromGithub() async {
    // TODO: implement getFeedFromGithub
    return null;
  }

  @override
  Future<List<Post>> getFeedFromMedium() async {
    http.Response response = await http
        .get("https://medium-json-feed.herokuapp.com/flutter/trending");
    final jsonDecoded = json.decode(response.body);
    final MediumResponse mediumResponse = MediumResponse.fromJson(jsonDecoded);
    return mediumResponse.posts;
  }
}
