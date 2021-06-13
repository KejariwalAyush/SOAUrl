import 'package:get/get.dart';

import '../controllers/url_stats_controller.dart';

class UrlStatsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UrlStatsController>(
      () => UrlStatsController(),
    );
  }
}
