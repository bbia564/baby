import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';

import '../../../../db_baby/baby_entity.dart';
import '../../../../db_baby/db_baby.dart';

class LeisureDetailsLogic extends GetxController {

  DBBaby dbBaby = Get.find<DBBaby>();

  var list = <BabyEntity>[].obs;

  void getData() async {
    final result = await dbBaby.getOneTypeAllData(1);
    list.value = result.where((e) => e.title == subTitle).toList();
  }

  var title = ''.obs;
  var subTitle = Get.arguments;

  Timer? upTimer;
  int upSeconds = 0;
  bool isStart = false;
  var upTimerStr = '00:00'.obs;

  void startUpTimer() {
    isStart = true;
    update();
    upTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      upSeconds++;
      final int upTimerMinutes = upSeconds ~/ 60;
      final int upTimerSeconds = upSeconds % 60;
      upTimerStr.value =
      '${upTimerMinutes.toString().padLeft(2, '0')}:${upTimerSeconds.toString().padLeft(2, '0')}';
    });
  }

  void stopUpTimer(bool addData) async {
    if (addData) {
      await dbBaby.insertBaby(BabyEntity(
          id: 0,
          createTime: DateTime.now(),
          type: 1,
          title: subTitle,
          content: '${upSeconds}s'));
    }
    upTimer?.cancel();
    upTimer = null;
    isStart = false;
    upSeconds = 0;
    upTimerStr.value = '00:00';
    update();
    getData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    title.value = 'Leisure-$subTitle';
    getData();
    super.onInit();
  }

}
