import 'package:baby_activity/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'baby_first_logic.dart';

class BabyFirstPage extends GetView<BabyFirstLogic> {
  Widget _item(int index) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: <Widget>[
        Image.asset(
          'assets/icon$index.webp',
          width: 30,
          height: 30,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: Text(
          itemTitles[index],
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        )),
        const Icon(
          Icons.keyboard_arrow_right,
          size: 22,
          color: Colors.white,
        )
      ].toRow(),
    )
        .decorated(
            color: itemColors[index], borderRadius: BorderRadius.circular(12))
        .marginOnly(bottom: 10)
        .gestures(onTap: () {
      switch (index) {
        case 0:
          Get.toNamed('/sleep',arguments: index);
          break;
        case 1:
          Get.toNamed('/leisure',arguments: index);
          break;
        case 2:
          Get.toNamed('/feeding',arguments: index);
          break;
        case 3:
          Get.toNamed('/diapers',arguments: index);
          break;
        case 4:
          Get.toNamed('/growth',arguments: index);
          break;
        case 5:
          Get.toNamed('/health',arguments: index);
          break;
        case 6:
          Get.toNamed('/pumping',arguments: index);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            _item(0),
            _item(1),
            _item(2),
            _item(3),
            _item(4),
            _item(5),
            _item(6)
          ].toColumn(),
        ).marginAll(15)),
      ),
    );
  }
}
