import 'package:get/get.dart';

import 'baby_third_logic.dart';

class BabyThirdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BabyThirdLogic());
  }
}
