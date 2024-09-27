import 'package:get/get.dart';

import 'leisure_details_logic.dart';

class LeisureDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LeisureDetailsLogic());
  }
}
