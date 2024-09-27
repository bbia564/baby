import 'package:get/get.dart';

import 'health_details_logic.dart';

class HealthDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HealthDetailsLogic());
  }
}
