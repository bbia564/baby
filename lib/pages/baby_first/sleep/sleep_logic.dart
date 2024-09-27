import 'dart:async';

import 'package:baby_activity/db_baby/baby_entity.dart';
import 'package:baby_activity/db_baby/db_baby.dart';
import 'package:get/get.dart';

class SleepLogic extends GetxController {
  DBBaby dbBaby = Get.find<DBBaby>();

  int type = Get.arguments;

  var list = <BabyEntity>[].obs;

  var upTimerStr = '00:00'.obs;
  int upSeconds = 0;
  bool isStart = false;

  Timer? upTimer;

  void getData() async {
    list.value = await dbBaby.getOneTypeAllData(type);
  }

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
          type: type,
          title: 'Sleep',
          content: '${upSeconds}s sleep'));
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
    getData();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    stopUpTimer(false);
    super.onClose();
  }
}
