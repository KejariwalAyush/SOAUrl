import 'dart:async';

import 'package:get/get.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:soaurl/app/routes/app_pages.dart';

class ReceiveIntentService extends GetxService {
  late StreamSubscription _intentDataStreamSubscription;
  String? sharedText;

  Future<ReceiveIntentService> init() async {
    // sharedText = '';
    // For sharing or opening urls/text coming from outside the app while the app is in the memory
    _intentDataStreamSubscription =
        ReceiveSharingIntent.getTextStreamAsUri().listen((Uri value) {
      sharedText = value.toString();
      Get.log('-------Sharing Intent: $sharedText');
      Get.toNamed(Routes.QR, parameters: {'text': value.toString()});
    }, onError: (err) {
      print("getLinkStream error: $err");
    });

    // For sharing or opening urls/text coming from outside the app while the app is closed
    ReceiveSharingIntent.getInitialTextAsUri().then((Uri? value) {
      sharedText = value.toString();
      Get.log('-------Init Sharing Intent: $sharedText');
    });
    print('Receive Intent ready');
    return this;
  }

  void dispose() {
    _intentDataStreamSubscription.cancel();
  }
}
