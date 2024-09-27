import 'package:get/get.dart';

import 'growth_details_logic.dart';

class GrowthDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GrowthDetailsLogic());
  }
}
