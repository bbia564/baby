
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'baby_third_logic.dart';

class BabyThirdPage extends GetView<BabyThirdLogic> {
  Widget _item(int index, BuildContext context) {
    final titles = ['Clean all records', 'Privacy agreement', 'About US'];
    return Container(
      color: Colors.transparent,
      height: 40,
      child: <Widget>[
        Text(titles[index]),
        index == 2 ? Text('1.0.0').paddingOnly(right: 10) : const Icon(
          Icons.keyboard_arrow_right,
          size: 20,
          color: Colors.grey,
        )
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    ).gestures(onTap: () {
      switch (index) {
        case 0:
          controller.cleanBabyData();
          break;
        case 1:
          controller.aboutBabyPrivacy(context);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            Container(
              padding: const EdgeInsets.all(12),
              child: <Widget>[
                _item(0, context),
                _item(1, context),
                _item(2, context)
              ].toColumn(
                  separator: Divider(
                height: 15,
                color: Colors.grey.withOpacity(0.3),
              )),
            ).decorated(color: const Color(0xfffafafa), borderRadius: BorderRadius.circular(12))
          ].toColumn(),
        ).marginAll(15)),
      ),
    );
  }
}
