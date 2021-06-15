import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QrController extends GetxController {
  final GlobalKey previewContainer = new GlobalKey();
  RxString qrData = "https://github.com/KejariwalAyush".obs;
  var qrdataFeed = TextEditingController();

  void updateQR() {
    qrData.value = qrdataFeed.text;
    update();
  }

  @override
  void onInit() {
    var _text = Get.parameters['text'];
    if (_text != null) {
      qrData.value = _text;
      qrdataFeed = TextEditingController(text: qrData.value);
      update();
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
