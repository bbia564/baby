
import 'dart:math';

import 'package:baby_activity/db_baby/baby_entity.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DBBaby extends GetxService {
  late Database dbBase;

  Future<DBBaby> init() async {
    await createBabyDB();
    return this;
  }

  createBabyDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'baby.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createBabyTable(db);
        });
  }

  createBabyTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS baby (id INTEGER PRIMARY KEY, createTime TEXT, type INTEGER, title TEXT, content TEXT)');
  }

  insertBaby(BabyEntity entity) async {
    final id = await dbBase.insert('baby', {
      'createTime': entity.createTime.toIso8601String(),
      'type': entity.type,
      'title': entity.title,
      'content': entity.content
    });
    return id;
  }

  cleanBabyData() async {
    await dbBase.delete('baby');
  }


  Future<List<List<BabyEntity>>> getBabyAllData() async {
    final List<Map<String, dynamic>> maps = await dbBase.query('baby');
    Map<String, List<BabyEntity>> grouped = {};

    for (var map in maps) {
      BabyEntity entity = BabyEntity(
        id: map['id'],
        createTime: DateTime.parse(map['createTime']),
        type: map['type'],
        title: map['title'],
        content: map['content'],
      );

      String date = entity.createTime.toIso8601String().substring(0, 10);
      grouped.putIfAbsent(date, () => []).add(entity);
    }

    return grouped.entries.map((entry) => entry.value).toList();
  }

  Future<List<BabyEntity>> getOneTypeAllData(int type) async {
    var result = await dbBase.query('baby', orderBy: 'createTime DESC');
    return result.map((e) => BabyEntity.fromJson(e)).toList().where((e) => e.type == type).toList();
  }

}
