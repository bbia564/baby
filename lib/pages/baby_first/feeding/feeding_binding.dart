import 'package:get/get.dart';

import 'feeding_logic.dart';

class FeedingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FeedingLogic());
  }
}
