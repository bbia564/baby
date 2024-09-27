import 'package:get/get.dart';

import '../../../db_baby/baby_entity.dart';
import '../../../db_baby/db_baby.dart';

class PumpingLogic extends GetxController {
  DBBaby dbBaby = Get.find<DBBaby>();

  int type = Get.arguments;

  var list = <BabyEntity>[].obs;

  void getData() async {
    list.value = await dbBaby.getOneTypeAllData(type);
  }

  void addData(int index) async {
    final contents = ['Left', 'Both', 'Right'];
    await dbBaby.insertBaby(BabyEntity(
        id: 0,
        createTime: DateTime.now(),
        type: 6,
        title: 'Pumping',
        content: contents[index]));
    getData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }
}
