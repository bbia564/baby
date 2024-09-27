import 'package:intl/intl.dart';

class BabyEntity {
  int id;
  DateTime createTime;
  int type;
  String title;
  String content;

  BabyEntity({
    required this.id,
    required this.createTime,
    required this.type,
    required this.title,
    required this.content,
  });

  factory BabyEntity.fromJson(Map<String, dynamic> json) {
    return BabyEntity(
      id: json['id'],
      createTime: DateTime.parse(json['createTime']),
      type: json['type'],
      title: json['title'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createTime': createTime.toIso8601String(),
      'type': type,
      'title': title,
      'content': content,
    };
  }

  String get ymdTimeStr {
    return DateFormat('yyyy-MM-dd').format(createTime);
  }

  String get activityTimeStr {
    return DateFormat('HH:mm').format(createTime);
  }

  String get createTimeStr {
    final now = DateTime.now();
    if (now.year == createTime.year && now.month == createTime.month && now.day == createTime.day) {
      return DateFormat('HH:mm').format(createTime);
    }
    return DateFormat('yyyy-MM-dd HH:mm').format(createTime);
  }

}