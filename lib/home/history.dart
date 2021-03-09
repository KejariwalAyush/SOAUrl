import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soaurl/constants.dart';
import 'package:soaurl/models/qr_details.dart';
import 'package:soaurl/widgets/background_widget.dart';
import 'package:soaurl/widgets/save_button_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class History extends StatelessWidget {
  History({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: BackgroundWidget(
          size: size,
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(20),
                // width: size.width,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    'assets/icons/back_arrow.svg',
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                    height: 30,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(20),
                // width: size.width,
                child: SvgPicture.asset(
                  'assets/icons/history.svg',
                  fit: BoxFit.fill,
                  height: 100,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                // width: size.width,
                child: Text(
                  'History',
                  style: TextStyle(
                    fontSize: 45,
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
              Expanded(
                  child: Container(
                child: FutureBuilder<List<QrDetails>>(
                  future: SharedPreferences.getInstance().then((value) => value
                      .getStringList('history')
                      .map((e) => QrDetails.fromJson(e))
                      .toList()),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData)
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    List<QrDetails> _list = snapshot.data;
                    if (_list.isEmpty)
                      return Center(child: Text('No Data Available!'));
                    _list.sort((a, b) => a.time.compareTo(b.time));
                    // _list.reversed;
                    return Scrollbar(
                      hoverThickness: 14,
                      radius: Radius.circular(10),
                      thickness: 12,
                      child: ListView.builder(
                        itemCount: _list.length,
                        // reverse: true,
                        itemBuilder: (BuildContext context, int index) {
                          QrDetails qrDetails = _list[_list.length - index - 1];
                          return HistoryListTile(qrDetails: qrDetails);
                        },
                      ),
                    );
                  },
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class HistoryListTile extends StatelessWidget {
  const HistoryListTile({
    Key key,
    @required this.qrDetails,
  }) : super(key: key);

  final QrDetails qrDetails;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 13, 20, 0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              leading: SvgPicture.asset(
                'assets/icons/${qrDetails.scanned ? 'qr_phone.svg' : 'qr_large.svg'}',
                color: Colors.purple.shade900,
                height: 50,
                fit: BoxFit.fill,
              ),
              trailing: AutoSizeText(
                durationString(DateTime.now().difference(qrDetails.time)),
                minFontSize: 12,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.end,
              ),
              title: GestureDetector(
                onTap: () => _launchURL(qrDetails.text),
                onLongPress: () {
                  Clipboard.setData(
                    ClipboardData(text: qrDetails.text),
                  );
                  Fluttertoast.showToast(msg: 'Copied to Clipboard!');
                },
                child: AutoSizeText(
                  qrDetails.text,
                  minFontSize: 14,
                  maxFontSize: 20,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: -8,
          right: 10,
          child: GestureDetector(
            onTap: () {
              print('saving...');
              SaveItButton(qrData: qrDetails.text, scanned: qrDetails.scanned)
                  .showSaveDialog(context);
            },
            child: SvgPicture.asset(
              'assets/icons/bookmark.svg',
              height: 50,
              color: Colors.deepPurple[900],
            ),
          ),
        ),
      ],
    );
  }

  _launchURL(String url) async {
    if (url.trim().contains(' ') || !url.contains('.')) {
      Fluttertoast.showToast(
          msg: 'Could Not Launch url', backgroundColor: Colors.red);
      // throw 'Could not launch $url';
      return;
    }
    if (!url.contains('http')) url = 'https://' + url;
    log(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Fluttertoast.showToast(
          msg: 'Could Not Launch url', backgroundColor: Colors.red);
      throw 'Could not launch $url';
    }
  }
}
