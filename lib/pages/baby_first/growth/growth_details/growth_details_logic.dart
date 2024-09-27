import 'dart:math';

import 'package:get/get.dart';

import '../../../../db_baby/baby_entity.dart';
import '../../../../db_baby/db_baby.dart';

class GrowthDetailsLogic extends GetxController {

  DBBaby dbBaby = Get.find<DBBaby>();

  var title = ''.obs;

  String subTitle = Get.arguments;

  var valueNum = 0.obs;

  var list = <BabyEntity>[].obs;

  void getData() async {
    final result = await dbBaby.getOneTypeAllData(4);
    list.value = result.where((e) => e.title == subTitle).toList();
  }

  void addData() async {
    await dbBaby.insertBaby(BabyEntity(
        id: 0,
        createTime: DateTime.now(),
        type: 4,
        title: subTitle,
        content: '${valueNum.value.toString()} cm'));
    getData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    title.value = 'Growth-$subTitle';
    getData();
    super.onInit();
  }

}
