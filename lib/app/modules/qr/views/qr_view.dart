import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:soaurl/app/data/data.dart';
import 'package:velocity_x/velocity_x.dart';
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: controller.qrdataFeed,
              style: GoogleFonts.varela(color: Colors.white),
              maxLines: 2,
              minLines: 1,
              // onTap: ,
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white54),
                  icon: Icon(
                    Icons.text_fields_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                  hintText: "Enter your link/text here...",
                  fillColor: Colors.white),
            ),
            20.heightBox,
            KBlurButton(
              child: 'Generate Qr'.text.textStyle(ktsButtonBlank).make().p8(),
              onPressed: controller.updateQR,
            ),
            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() => DisplayQR(
                      previewContainer: controller.previewContainer,
                      qrData: controller.qrData.value,
                    )),
                IconButton(
                  icon:
                      Icon(Icons.share_rounded, size: 30, color: Colors.white),
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
      ),
    );
  }
}

class DisplayQR extends StatelessWidget {
  const DisplayQR({
    Key? key,
    required this.previewContainer,
    required this.qrData,
    this.size = 200,
    this.roundedQR = true,
  }) : super(key: key);

  final String qrData;
  final GlobalKey previewContainer;
  final double size;
  final bool roundedQR;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: UniqueKey(),
      child: RepaintBoundary(
        key: previewContainer,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17), color: Colors.white),
          child: PrettyQr(
            data: qrData,
            size: size,
            roundEdges: roundedQR,
            typeNumber: 3,
            errorCorrectLevel: QrErrorCorrectLevel.M,
            image: Get.find<SettingsService>().showLogoinQR.value
                ? AssetImage(
                    'assets/icons/logo-no-bg.png',
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
