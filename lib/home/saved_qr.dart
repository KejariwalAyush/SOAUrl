import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:soaurl/constants.dart';
import 'package:soaurl/models/qr_details.dart';
import 'package:soaurl/widgets/background_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class Saved extends StatefulWidget {
  const Saved({Key key}) : super(key: key);

  @override
  _SavedState createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  final TextEditingController searchController = new TextEditingController();
  String searchData = '';
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
                    'assets/images/back_arrow.svg',
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
                  'assets/images/saved.svg',
                  fit: BoxFit.fill,
                  height: 100,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                // width: size.width,
                child: Text(
                  'Saved',
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.search_rounded,
                      color: Colors.deepPurpleAccent,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'Search by name & tags',
                        ),
                        onChanged: (value) {
                          setState(() {
                            searchData = value.toLowerCase().trim();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                child: FutureBuilder<List<QrDetails>>(
                  future: FirebaseFirestore.instance
                      .collection('users')
                      .doc(user.uid)
                      .collection('saved')
                      .get()
                      .then((value) => value.docs
                          .map((e) => QrDetails.fromMap(e.data()))
                          .toList()),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData)
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    List<QrDetails> _list = snapshot.data;

                    if ((searchData ?? '') != '')
                      _list = _list
                          .map((e) => (e.title
                                      .toLowerCase()
                                      .contains(searchData) ||
                                  // e.text.toLowerCase().contains(searchData) ||
                                  e.tags.contains(searchData))
                              ? e
                              : null)
                          .toList()
                            ..removeWhere((e) => e == null);
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
                          return SavedListTile(qrDetails: qrDetails);
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

class SavedListTile extends StatelessWidget {
  const SavedListTile({
    Key key,
    @required this.qrDetails,
  }) : super(key: key);

  final QrDetails qrDetails;

  @override
  Widget build(BuildContext context) {
    UniqueKey _key = new UniqueKey();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Dismissible(
          key: _key,
          background: Container(
            decoration: BoxDecoration(
              color: Colors.redAccent.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          direction: DismissDirection.endToStart,
          // confirmDismiss: (direction) {
          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar( duration: Duration(seconds: 3),
          //     content: Text('QR details Delete'),action: SnackBarAction(label: 'Undo',onPressed: ()=> false,),));
          // },
          onDismissed: (direction) async {
            log(direction.toString());
            await FirebaseFirestore.instance
                .collection('users')
                .doc(user.uid)
                .collection('saved')
                .doc(qrDetails.id)
                .delete()
                .then((value) {
              // log('deleted');
            });
            log('deleted sucessfully');
          },
          child: ListTile(
            contentPadding: EdgeInsets.all(10),
            leading: SvgPicture.asset(
              'assets/images/${qrDetails.scanned ? 'qr_phone.svg' : 'qr_large.svg'}',
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
            title: AutoSizeText(
              qrDetails.title,
              minFontSize: 14,
              maxFontSize: 20,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: GestureDetector(
              onTap: () => _launchURL(qrDetails.text),
              onLongPress: () {
                Clipboard.setData(
                  ClipboardData(text: qrDetails.text),
                );
                Fluttertoast.showToast(msg: 'Copied to Clipboard!');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    qrDetails.text,
                    minFontSize: 16,
                    maxFontSize: 20,
                    maxLines: 3,
                    style: TextStyle(fontWeight: FontWeight.w700),
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (qrDetails.tags.toString() != '[]')
                    AutoSizeText(
                      qrDetails.tags.toString(),
                      minFontSize: 12,
                      maxFontSize: 18,
                      maxLines: 3,
                      style: TextStyle(fontWeight: FontWeight.w300),
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
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
