abstract class NewsRepository {
  Future<Map> getFeedFromMedium();

  Future<Map> getFeedFromGithub();
}

class NewsRepositoryImpl implements NewsRepository {

  @override
  Future<Map> getFeedFromGithub() async {
    // TODO: implement getFeedFromGithub
    return null;
  }

  @override
  Future<Map> getFeedFromMedium() async {
    // TODO: implement getFeedFromMedium
    return null;
  }
}
