import 'package:baby_activity/db_baby/db_baby.dart';
import 'package:baby_activity/pages/baby_first/baby_first_binding.dart';
import 'package:baby_activity/pages/baby_first/baby_first_view.dart';
import 'package:baby_activity/pages/baby_first/bdl/bdl_binding.dart';
import 'package:baby_activity/pages/baby_first/bdl/bdl_view.dart';
import 'package:baby_activity/pages/baby_first/diapers/diapers_binding.dart';
import 'package:baby_activity/pages/baby_first/diapers/diapers_view.dart';
import 'package:baby_activity/pages/baby_first/feeding/feeding_binding.dart';
import 'package:baby_activity/pages/baby_first/feeding/feeding_view.dart';
import 'package:baby_activity/pages/baby_first/growth/growth_binding.dart';
import 'package:baby_activity/pages/baby_first/growth/growth_details/growth_details_binding.dart';
import 'package:baby_activity/pages/baby_first/growth/growth_details/growth_details_view.dart';
import 'package:baby_activity/pages/baby_first/growth/growth_view.dart';
import 'package:baby_activity/pages/baby_first/health/health_binding.dart';
import 'package:baby_activity/pages/baby_first/health/health_details/health_details_binding.dart';
import 'package:baby_activity/pages/baby_first/health/health_details/health_details_view.dart';
import 'package:baby_activity/pages/baby_first/health/health_view.dart';
import 'package:baby_activity/pages/baby_first/leisure/leisure_binding.dart';
import 'package:baby_activity/pages/baby_first/leisure/leisure_details/leisure_details_binding.dart';
import 'package:baby_activity/pages/baby_first/leisure/leisure_details/leisure_details_view.dart';
import 'package:baby_activity/pages/baby_first/leisure/leisure_view.dart';
import 'package:baby_activity/pages/baby_first/pumping/pumping_binding.dart';
import 'package:baby_activity/pages/baby_first/pumping/pumping_view.dart';
import 'package:baby_activity/pages/baby_first/sleep/sleep_binding.dart';
import 'package:baby_activity/pages/baby_first/sleep/sleep_view.dart';
import 'package:baby_activity/pages/baby_second/baby_second_binding.dart';
import 'package:baby_activity/pages/baby_second/baby_second_view.dart';
import 'package:baby_activity/pages/baby_second/rule.dart';
import 'package:baby_activity/pages/baby_tab/baby_tab_binding.dart';
import 'package:baby_activity/pages/baby_tab/baby_tab_view.dart';
import 'package:baby_activity/pages/baby_third/baby_third_binding.dart';
import 'package:baby_activity/pages/baby_third/baby_third_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Color primaryColor = const Color(0xff2eba95);
Color bgColor = Colors.white;
List<String> itemTitles = [
  'Sleep',
  'Leisure',
  'Feeding',
  'Diapers',
  'Growth',
  'Health',
  'Pumping'
];
List<Color> itemColors = [
  const Color(0xffe5e5ff),
  const Color(0xffffe8db),
  const Color(0xffd8e8f9),
  const Color(0xffeeecff),
  const Color(0xffffdee5),
  const Color(0xffd2f7e5),
  const Color(0xffeaf6ff),
];

List<Color> itemBGColors = [
  const Color(0xff8080ff),
  const Color(0xffd97c41),
  const Color(0xff4496ed),
  const Color(0xff4496ed),
  const Color(0xfff8869d),
  const Color(0xff3cc602),
  const Color(0xff4496ed),
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBBaby().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Baaes,
      initialRoute: '/',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: const Color(0xfffafafa),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Baaes = [
  GetPage(name: '/', page: () => const BdlViewPage(), binding: BdlBinding()),
  GetPage(name: '/babyTab', page: () => BabyTabPage(), binding: BabyTabBinding()),
  GetPage(name: '/babyFirst', page: () => BabyFirstPage(), binding: BabyFirstBinding()),
  GetPage(name: '/babySecond', page: () => BabySecondPage(), binding: BabySecondBinding()),
  GetPage(name: '/babyThird', page: () => BabyThirdPage(), binding: BabyThirdBinding()),
  GetPage(name: '/sleep', page: () => SleepPage(), binding: SleepBinding()),
  GetPage(name: '/babyRule', page: () => const RuleContral()),
  GetPage(name: '/leisure', page: () => LeisurePage(), binding: LeisureBinding()),
  GetPage(name: '/leisureDetails', page: () => LeisureDetailsPage(), binding: LeisureDetailsBinding()),
  GetPage(name: '/feeding', page: () => FeedingPage(), binding: FeedingBinding()),
  GetPage(name: '/diapers', page: () => DiapersPage(), binding: DiapersBinding()),
  GetPage(name: '/growth', page: () => GrowthPage(), binding: GrowthBinding()),
  GetPage(name: '/growthDetails', page: () => GrowthDetailsPage(), binding: GrowthDetailsBinding()),
  GetPage(name: '/health', page: () => HealthPage(), binding: HealthBinding()),
  GetPage(name: '/healthDetails', page: () => HealthDetailsPage(), binding: HealthDetailsBinding()),
  GetPage(name: '/pumping', page: () => PumpingPage(), binding: PumpingBinding())
];