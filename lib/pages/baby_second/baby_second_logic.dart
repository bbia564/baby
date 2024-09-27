import 'package:baby_activity/db_baby/db_baby.dart';
import 'package:get/get.dart';

import '../../db_baby/baby_entity.dart';

class BabySecondLogic extends GetxController {

  DBBaby dbBaby = Get.find<DBBaby>();

  var list = <List<BabyEntity>>[].obs;

  void getData() async {
    list.value = await dbBaby.getBabyAllData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
