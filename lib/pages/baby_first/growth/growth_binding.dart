import 'package:get/get.dart';

import 'growth_logic.dart';

class GrowthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GrowthLogic());
  }
}
