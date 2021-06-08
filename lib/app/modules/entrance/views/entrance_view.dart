import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soaurl/app/data/data.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/entrance_controller.dart';

class Splash extends GetView<EntranceController> {
  @override
  Widget build(BuildContext context) {
    Get.find<EntranceController>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: KBackgroundContainerOnlyGradient(
        size: size,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                  'assets/icons/logo-no-bg.png',
                  height: 300,
                ),
              ),
              50.squareBox,
              'SOAUrl'.text.textStyle(ktsHeading2).make().py8(),
              'Shortform Of Any Url'.text.textStyle(ktsSubHeading).make(),
            ],
          ),
        ),
      ),
    );
  }
}
