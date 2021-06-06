import 'package:get/get.dart';

import '../controllers/entrance_controller.dart';

class EntranceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EntranceController>(
      () => EntranceController(),
    );
  }
}
