import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soaurl/app/data/data.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    Get.find<LoginController>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: KBackgroundContainer(
        size: size,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/icons/logo-no-bg.png',
                    width: 250,
                  ),
                  30.squareBox,
                  'SOAUrl'.text.textStyle(ktsHeading2).make().py8(),
                  'Shortform Of Any Url'.text.textStyle(ktsSubHeading).make(),
                ],
              ),
              controller.isLoading.value
                  ? KLoadingWidget()
                  : KbWhiteButton.google(onPressed: controller.onSignin),
            ],
          ),
        ).px24(),
      ),
    );
  }
}
