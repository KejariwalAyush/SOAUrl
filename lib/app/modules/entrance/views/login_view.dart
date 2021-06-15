import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soaurl/app/data/data.dart';
import 'package:soaurl/app/routes/app_pages.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Get.mediaQuery.padding.top.heightBox,
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () => Get.toNamed(Routes.ABOUT_US),
                label: 'About Us'.text.textStyle(ktsButtonBlank).make(),
                icon: Icon(
                  Icons.info_outline,
                  color: kcWhite,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      LogoWidget(size: 200),
                      30.squareBox,
                      'SOAUrl'.text.textStyle(ktsHeading2).make().py8(),
                      'Shortform Of Any Url'
                          .text
                          .textStyle(ktsSubHeading)
                          .make(),
                    ],
                  ),
                  controller.isLoading.value
                      ? KLoadingWidget()
                      : Container(
                          constraints: BoxConstraints(maxWidth: 400),
                          child: KbWhiteButton.google(
                              onPressed: controller.onSignin)),
                ],
              ).px24(),
            ),
          ],
        ),
      ),
    );
  }
}
