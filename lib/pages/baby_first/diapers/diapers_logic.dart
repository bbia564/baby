import 'package:get/get.dart';

import '../../../db_baby/baby_entity.dart';
import '../../../db_baby/db_baby.dart';

class DiapersLogic extends GetxController {

  DBBaby dbBaby = Get.find<DBBaby>();

  int type = Get.arguments;

  var list = <BabyEntity>[].obs;

  void getData() async {
    list.value = await dbBaby.getOneTypeAllData(type);
  }

  void addData(int index) async {
    final titles = ['Pee','Both','Poo'];
    await dbBaby.insertBaby(BabyEntity(
        id: 0,
        createTime: DateTime.now(),
        type: type,
        title: 'Diapers',
        content: titles[index]));
    getData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
