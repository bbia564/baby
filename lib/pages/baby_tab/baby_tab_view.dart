import 'package:baby_activity/pages/baby_first/baby_first_view.dart';
import 'package:baby_activity/pages/baby_second/baby_second_logic.dart';
import 'package:baby_activity/pages/baby_second/baby_second_view.dart';
import 'package:baby_activity/pages/baby_third/baby_third_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'baby_tab_logic.dart';

class BabyTabPage extends GetView<BabyTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          BabyFirstPage(),
          BabySecondPage(),
          BabyThirdPage()
        ],
      ),
      bottomNavigationBar: Obx(()=>_navBabyBars()),
    );
  }

  Widget _navBabyBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/item0Unselect.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item0Selected.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/item1Unselect.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item1Selected.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Baby Activity',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/item2Unselect.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item2Selected.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Setting',
        )
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        if (index == 1) {
          BabySecondLogic babySecondLogic = Get.find<BabySecondLogic>();
          babySecondLogic.getData();
        }
        controller.currentIndex.value = index;
        controller.pageController.jumpToPage(index);
      },
    );
  }
}
