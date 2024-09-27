import 'package:get/get.dart';

import 'health_logic.dart';

class HealthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HealthLogic());
  }
}
