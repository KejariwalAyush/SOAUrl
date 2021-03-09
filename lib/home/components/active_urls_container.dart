import 'dart:convert';
// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soaurl/constants.dart';
import 'package:soaurl/home/shorturl_detail_page.dart';
import 'package:soaurl/models/url_details.dart';
import 'package:soaurl/services/network_helper.dart';

class ActiveUrlsContainer extends StatefulWidget {
  const ActiveUrlsContainer({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _ActiveUrlsContainerState createState() => _ActiveUrlsContainerState();
}

class _ActiveUrlsContainerState extends State<ActiveUrlsContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      height: 350,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Your Active Short Urls',
                  style: TextStyle(
                    fontSize: 25,
                    color: const Color(0xfff2eaff),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                IconButton(
                  icon: Icon(Icons.refresh_rounded),
                  onPressed: () {
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: FutureBuilder<UrlList>(
                future: NetworkHelper()
                    .post('http://soaurl.ml/api/get',
                        jsonEncode({'userId': user.uid}))
                    .then((value) {
                  if (value.toString().contains("status") &&
                      value.toString().contains("error"))
                    return UrlList(urlDetails: null);
                  return UrlList.fromJson(
                      '{"urlDetails":' + value.toString() + '}');
                }),
                builder:
                    (BuildContext context, AsyncSnapshot<UrlList> snapshot) {
                  if (!snapshot.hasData)
                    return Center(child: CircularProgressIndicator());

                  if (snapshot.data.urlDetails == null)
                    return Center(
                      child: Text(
                        'No Shortened Urls Yet',
                        style: TextStyle(
                          fontSize: 15,
                          color: const Color(0xfff2eaff),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  List<UrlDetails> _urls = snapshot.data.urlDetails;
                  return Scrollbar(
                    child: ListView.builder(
                      itemCount: _urls.length,
                      itemBuilder: (BuildContext context, int index) {
                        UrlDetails urlDetails = _urls[index];
                        return Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          alignment: Alignment.centerLeft,
                          child: ListTile(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ShortUrlDetailsPage(
                                      urlDetails: urlDetails),
                                )),
                            title: Text(
                              'soaurl.ml/' + urlDetails.shortUrl,
                              style: TextStyle(
                                fontSize: 22,
                                color: const Color(0xfff2eaff),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            leading: SvgPicture.asset(
                              'assets/icons/url.svg',
                              height: 30,
                              fit: BoxFit.contain,
                              color: Colors.white,
                            ),
                            trailing: (widget.size.width > 700)
                                ? Text(
                                    'Clicks ' +
                                        urlDetails.stats.length.toString(),
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: const Color(0xfff2eaff),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                : Icon(
                                    Icons.arrow_right,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                            // mouseCursor: MouseCursor.defer,
                            hoverColor: Colors.blueGrey.shade200,
                            focusColor: Colors.purpleAccent,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
