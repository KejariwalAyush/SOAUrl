import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../data.dart';

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
