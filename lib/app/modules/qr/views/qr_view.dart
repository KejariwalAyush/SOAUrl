import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:soaurl/app/data/data.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../controllers/qr_controller.dart';

class QrView extends GetView<QrController> {
  @override
  Widget build(BuildContext context) {
    final double _minHeight = 78.0;
    final double _maxHeight = 285.0;
    final KAppBar appbar =
        new KAppBar(collapsedHeight: _minHeight, expandedHeight: _maxHeight);
    return SliverAppBarSnap(
      maxHeight: _maxHeight,
      minHeight: _minHeight,
      appBarContent: LayoutBuilder(
        builder: (context, constraints) =>
            appbar.appBarContainer(KAppBarContent(
                animation: appbar.getAnimation(constraints),
                mainIcon: WebsafeSvg.asset(
                  'assets/icons/qr_large.svg',
                  fit: BoxFit.fill,
                  height: Tween<double>(begin: 0, end: 125)
                      .evaluate(appbar.getAnimation(constraints)),
                ),
                title: 'Generate QR')),
      ),
      isChildScrollable: true,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                key: UniqueKey(),
                child: RepaintBoundary(
                  key: controller.previewContainer,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: Colors.white),
                    child: PrettyQr(
                      data: controller.qrData,
                      size: 200,
                      roundEdges: true, //roundedQr,
                      typeNumber: 3,
                      errorCorrectLevel: QrErrorCorrectLevel.M,
                      image: AssetImage(
                        'assets/icons/logo-no-bg.png',
                      ),
                      // qrWithLogo
                      //     ? AssetImage(
                      //         'assets/icons/logo-no-bg.png',
                      //       )
                      //     : null,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.share_rounded, size: 30, color: Colors.white),
                tooltip: 'Share QR',
                onPressed: () {
                  // ShareFilesAndScreenshotWidgets().shareScreenshot(
                  //     previewContainer, 800, "QR", "qr.png", "image/png",
                  //     text: "");
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
