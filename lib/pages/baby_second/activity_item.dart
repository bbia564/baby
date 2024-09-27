import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../db_baby/baby_entity.dart';
import '../../main.dart';

class ActivityItem extends StatefulWidget {
  const ActivityItem(this.list, {Key? key}) : super(key: key);
  final List<BabyEntity> list;

  @override
  State<ActivityItem> createState() => _ActivityItemState();
}

class _ActivityItemState extends State<ActivityItem> {
  @override
  Widget build(BuildContext context) {
    return <Widget>[
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(5),
        child: Text(
          widget.list.first.ymdTimeStr,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      )
          .decorated(
              color: const Color(0xfff4f4f4),
              borderRadius: BorderRadius.circular(8))
          .marginOnly(bottom: 10),
      ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: widget.list.length,
          itemBuilder: (_, index) {
            final entity = widget.list[index];
            return <Widget>[
              Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  entity.title.substring(0, 1),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: itemBGColors[entity.type]),
                ),
              ).decorated(
                  color: itemColors[entity.type],
                  borderRadius: BorderRadius.circular(8)),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: <Widget>[
                <Widget>[
                  Expanded(
                      child: <Widget>[
                    Text(
                      entity.title,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      entity.content,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                    )
                  ].toColumn(crossAxisAlignment: CrossAxisAlignment.start)),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    entity.activityTimeStr,
                    style: const TextStyle(fontSize: 14),
                  ),
                ].toRow(),
                Divider(
                  height: 25,
                  color: Colors.grey[300],
                )
              ].toColumn(crossAxisAlignment: CrossAxisAlignment.start))
            ].toRow(crossAxisAlignment: CrossAxisAlignment.start);
          })
    ].toColumn();
  }
}
