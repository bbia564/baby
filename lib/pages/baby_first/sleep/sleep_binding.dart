import 'package:get/get.dart';

import 'sleep_logic.dart';

class SleepBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SleepLogic());
  }
}
