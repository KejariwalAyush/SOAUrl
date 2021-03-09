import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr/qr.dart';
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';
import 'package:soaurl/constants.dart';
import 'package:soaurl/home/components/clicks_bar_chart.dart';
import 'package:soaurl/home/components/line_chart.dart';
import 'package:soaurl/home/components/pie_chart.dart';
import 'package:soaurl/models/url_details.dart';
import 'package:soaurl/widgets/background_widget.dart';

class ShortUrlDetailsPage extends StatefulWidget {
  ShortUrlDetailsPage({Key key, @required this.urlDetails}) : super(key: key);

  final UrlDetails urlDetails;

  @override
  _ShortUrlDetailsPageState createState() => _ShortUrlDetailsPageState();
}

class _ShortUrlDetailsPageState extends State<ShortUrlDetailsPage> {
  GlobalKey previewContainer = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    UrlDetails _urlDetails = widget.urlDetails;
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: BackgroundWidget(
            size: size,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    // height: size.height * 0.1,
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: SvgPicture.asset(
                            'assets/icons/back_arrow.svg',
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                            height: 30,
                          ),
                        ),
                        // IconButton(
                        //   icon: Icon(
                        //     Icons.logout,
                        //     size: 30,
                        //   ),
                        //   onPressed: () {},
                        // ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        key: UniqueKey(),
                        child: RepaintBoundary(
                          key: previewContainer,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                color: Colors.white),
                            child: PrettyQr(
                              data: 'http://soaurl.ml/' + _urlDetails.shortUrl,
                              size: 150,
                              roundEdges: roundedQr,
                              typeNumber: 3,
                              errorCorrectLevel: QrErrorCorrectLevel.M,
                              // image: qrWithLogo
                              //     ? AssetImage(
                              //         'assets/icons/logo-no-bg.png',
                              //       )
                              //     : null,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.share_rounded,
                            size: 30, color: Colors.white),
                        tooltip: 'Share QR',
                        onPressed: () {
                          ShareFilesAndScreenshotWidgets().shareScreenshot(
                              previewContainer,
                              800,
                              "QR",
                              "qr.png",
                              "image/png",
                              text: 'http://soaurl.ml/' + _urlDetails.shortUrl);
                        },
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    // width: size.width,
                    child: AutoSizeText(
                      'soaurl.ml/' + _urlDetails.shortUrl,
                      maxFontSize: 50,
                      minFontSize: 35,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        // fontSize: 45,
                        color: const Color(0xfff2eaff),
                        fontWeight: FontWeight.w700,
                        shadows: [
                          Shadow(
                            color: const Color(0xa1363636),
                            offset: Offset(0, 3),
                            blurRadius: 6,
                          )
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(8),
                      leading: SvgPicture.asset(
                        'assets/icons/url.svg',
                        width: 30,
                      ),
                      title: AutoSizeText(
                        'Long Url',
                        style: TextStyle(
                          color: const Color(0xfff2eaff),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: AutoSizeText(
                        _urlDetails.longUrl,
                        style: TextStyle(
                          color: const Color(0xfff2eaff),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width,
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'Created on',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        Text(
                          DateFormat.yMMMMd().format(_urlDetails.dateTime),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width,
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'Expireing on',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        Text(
                          DateFormat.yMMMMd().format(_urlDetails.dateTime
                              .add(Duration(days: _urlDetails.noOfDays))),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Stats',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClicksLineChart(
                      stats: _urlDetails.stats,
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: ClicksBarChart(
                  //     stats: _urlDetails.stats,
                  //   ),
                  // ),
                  if (widget.urlDetails.stats.length != 0)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Text(
                        'Devices Pie Chart',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  if (widget.urlDetails.stats.length != 0)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DevicePieChart(
                        stats: _urlDetails.stats,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
