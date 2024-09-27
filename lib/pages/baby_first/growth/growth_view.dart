import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../main.dart';
import 'growth_logic.dart';

class GrowthPage extends GetView<GrowthLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Growth')),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              children: [
                const SizedBox(
                  width: double.infinity,
                  height: 170 + 36,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  height: 170,
                  child: <Widget>[
                    const SizedBox(height: 26),
                    <Widget>[
                      Expanded(
                          child: Container(
                            height: 44,
                            alignment: Alignment.center,
                            child: const Text(
                              'Height',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          )
                              .decorated(
                              color: itemBGColors[controller.type],
                              borderRadius: BorderRadius.circular(12))
                              .gestures(onTap: () {
                            Get.toNamed('/growthDetails',arguments: 'Height')?.then((_) {
                              controller.getData();
                            });
                          })),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            height: 44,
                            child: const Text(
                              'Weight',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          )
                              .decorated(
                              color: itemBGColors[controller.type],
                              borderRadius: BorderRadius.circular(12))
                              .gestures(onTap: () {
                            Get.toNamed('/growthDetails',arguments: 'Weight')?.then((_) {
                              controller.getData();
                            });
                          }))
                    ].toRow(),
                    const SizedBox(height: 10,),
                    <Widget>[
                      Expanded(
                          child: Container(
                            height: 44,
                            alignment: Alignment.center,
                            child: const Text(
                              'Head',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          )
                              .decorated(
                              color: itemBGColors[controller.type],
                              borderRadius: BorderRadius.circular(12))
                              .gestures(onTap: () {
                            Get.toNamed('/growthDetails',arguments: 'Head')?.then((_) {
                              controller.getData();
                            });
                          })),
                      const SizedBox(
                        width: 10,
                      ),
                      const Expanded(
                          child: SizedBox())
                    ].toRow()
                  ].toColumn(),
                )
                    .decorated(
                    color: itemColors[controller.type],
                    borderRadius: BorderRadius.circular(12))
                    .marginOnly(top: 36),
                Image.asset(
                  'assets/growthLogo.webp',
                  width: 72,
                  height: 72,
                  fit: BoxFit.cover,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(() {
              return controller.list.value.isEmpty
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
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: controller.list.value.length,
                  itemBuilder: (_, index) {
                    final entity = controller.list.value[index];
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
                          color: itemColors[controller.type],
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
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      entity.content,
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    )
                                  ].toColumn(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start)),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                entity.createTimeStr,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ].toRow(),
                            Divider(
                              height: 25,
                              color: Colors.grey[300],
                            )
                          ].toColumn(
                              crossAxisAlignment: CrossAxisAlignment.start))
                    ].toRow(crossAxisAlignment: CrossAxisAlignment.start);
                  });
            })
          ].toColumn(),
        ).marginAll(15),
      ),
    );
  }
}
