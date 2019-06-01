class MediumResponse {
  List<Post> posts;

  MediumResponse({this.posts});

  factory MediumResponse.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['response'] as List;
    List<Post> feedList = list.map((i) => Post.fromJson(i)).toList();
    return MediumResponse(posts: feedList);
  }
}

class Post {
  String id;
  String title;
  int createdAt;

  Post({this.id, this.title, this.createdAt});

  factory Post.fromJson(Map<String, dynamic> parsedJson) {
    return Post(
        id: parsedJson['id'],
        title: parsedJson['title'],
        createdAt: parsedJson['createdAt']);
  }
}
