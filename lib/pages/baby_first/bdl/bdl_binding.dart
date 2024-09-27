import 'package:get/get.dart';

import 'bdl_logic.dart';

class BdlBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
