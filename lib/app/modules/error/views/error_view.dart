import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soaurl/app/data/data.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/error_controller.dart';

class ErrorView extends GetView<ErrorController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return KBackgroundContainer(
      size: size,
      child: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(style: BorderStyle.solid, color: kcBlack)),
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              '404'.text.xl4.white.make(),
              20.heightBox,
              'OOPS!, Looks like we have lost Connectivity to the server.\nCheck your connection or come back later.'
                  .text
                  .lg
                  .center
                  .textStyle(ktsHeading1)
                  .make(),
            ],
          ),
        ),
      ),
    );
  }
}
