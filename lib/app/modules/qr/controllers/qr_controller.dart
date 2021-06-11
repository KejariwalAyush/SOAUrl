import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QrController extends GetxController {
  String qrData = "https://github.com/KejariwalAyush";
  final GlobalKey previewContainer = new GlobalKey();
  final qrdataFeed = TextEditingController();

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
