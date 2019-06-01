import 'dart:async';
import 'dart:io';

import 'package:hack19/src/FeedItem.dart' show FeedItem;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    final Directory documentsDirectory =
        await getApplicationDocumentsDirectory();
    final String path = join(documentsDirectory.path, "Newstter.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Feed ("
          "id INTEGER PRIMARY KEY,"
          "title TEXT,"
          "link TEXT,"
          "image TEXT,"
          "content TEXT"
          ")");
    });
  }

  addFavoriteFeed(FeedItem item) async {
    final db = await database;
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Feed");
    int id = table.first["id"];
    var raw = await db.rawInsert(
        "INSERT Into Feed (id,title,link,image,content) VALUES (?,?,?,?,?)",
        [id, item.title, item.link, item.image, item.content]);
    return raw;
  }

  Future<List<FeedItem>> getAllFavorites() async {
    final db = await database;
    var res = await db.query("Feed");
    List<FeedItem> list = res.isNotEmpty
        ? res
            .map((c) =>
                FeedItem(c['title'], c['content'], c['image'], c['link']))
            .toList()
        : [];
    return list;
  }

  deleteFavoriteByLink(String link) async {
    final db = await database;
    return db.delete("Feed", where: "link = ?", whereArgs: [link]);
  }
}
