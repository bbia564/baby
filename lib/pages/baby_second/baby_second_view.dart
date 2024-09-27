import 'package:baby_activity/pages/baby_second/activity_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'baby_second_logic.dart';

class BabySecondPage extends GetView<BabySecondLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Baby Activity')),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: controller.list.value.isEmpty
                ? <Widget>[
                    Image.asset(
                      'assets/noData.webp',
                      width: 67,
                      height: 65,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'No data',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    )
                  ].toColumn().marginOnly(top: 100)
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: controller.list.value.length,
                    itemBuilder: (_, index) {
                      return ActivityItem(controller.list.value[index]);
                    }).marginAll(15)),
      ),
    );
  }
}
