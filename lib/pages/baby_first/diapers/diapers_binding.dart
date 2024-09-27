import 'package:get/get.dart';

import 'diapers_logic.dart';

class DiapersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DiapersLogic());
  }
}
