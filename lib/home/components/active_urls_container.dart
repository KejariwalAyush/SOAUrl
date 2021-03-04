import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
  bool showTitle = false;
  @override
  void initState() {
    super.initState();
    showTitle = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      height: 200,
      child: Column(
        children: [
          if (showTitle)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                'Your Active Short Urls',
                style: TextStyle(
                  fontSize: 25,
                  color: const Color(0xfff2eaff),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          Expanded(
            child: Container(
              child: FutureBuilder<UrlList>(
                future: NetworkHelper()
                    .post(
                        'http://soaurl.ml/api/get',
                        jsonEncode(
                            {'userId': 'e0f88d7b-de51-49fe-b537-f9f2df160024'}))
                    .then((value) => UrlList.fromJson(
                        '{"urlDetails":' + value.toString() + '}')),
                builder:
                    (BuildContext context, AsyncSnapshot<UrlList> snapshot) {
                  if (!snapshot.hasData) return CircularProgressIndicator();

                  if ((snapshot?.data ?? '') == '')
                    return Text(
                      'No Shortened Urls Yet',
                      style: TextStyle(
                        fontSize: 15,
                        color: const Color(0xfff2eaff),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
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
                            title: Text(
                              'soaurl.ml/' + urlDetails.shortUrl,
                              style: TextStyle(
                                fontSize: 22,
                                color: const Color(0xfff2eaff),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            leading: SvgPicture.asset(
                              'assets/images/url.svg',
                              height: 30,
                              fit: BoxFit.contain,
                              color: Colors.white,
                            ),
                            trailing: Icon(
                              Icons.arrow_right,
                              color: Colors.white,
                              size: 30,
                            ),
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
