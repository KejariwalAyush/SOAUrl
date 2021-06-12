import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QrController extends GetxController {
  RxString qrData = "https://github.com/KejariwalAyush".obs;
  final GlobalKey previewContainer = new GlobalKey();
  final qrdataFeed = TextEditingController();

  void updateQR() {
    qrData.value = qrdataFeed.text;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
