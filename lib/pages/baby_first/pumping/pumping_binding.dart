import 'package:get/get.dart';

import 'pumping_logic.dart';

class PumpingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PumpingLogic());
  }
}
