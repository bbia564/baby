import 'package:get/get.dart';

import '../../../db_baby/baby_entity.dart';
import '../../../db_baby/db_baby.dart';

class LeisureLogic extends GetxController {

  DBBaby dbBaby = Get.find<DBBaby>();

  int type = Get.arguments;

  var list = <BabyEntity>[].obs;

  void getData() async {
    list.value = await dbBaby.getOneTypeAllData(type);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
