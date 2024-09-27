import 'package:get/get.dart';

import 'leisure_logic.dart';

class LeisureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LeisureLogic());
  }
}
