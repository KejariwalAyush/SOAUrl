import 'package:get/get.dart';

import '../controllers/short_controller.dart';

class ShortBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShortController>(
      () => ShortController(),
    );
  }
}
