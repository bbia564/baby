import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../db_baby/baby_entity.dart';
import '../../../../db_baby/db_baby.dart';

class HealthDetailsLogic extends GetxController {

  DBBaby dbBaby = Get.find<DBBaby>();

  var title = ''.obs;
  var content = '';

  String subTitle = Get.arguments;

  var list = <BabyEntity>[].obs;

  void getData() async {
    final result = await dbBaby.getOneTypeAllData(5);
    list.value = result.where((e) => e.title == subTitle).toList();
  }

  void addData() async {
    if (content.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter content');
      return;
    }
    await dbBaby.insertBaby(BabyEntity(
        id: 0,
        createTime: DateTime.now(),
        type: 5,
        title: subTitle,
        content: content));
    getData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    title.value = 'Health-$subTitle';
    getData();
    super.onInit();
  }

}
