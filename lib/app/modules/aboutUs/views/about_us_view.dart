import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soaurl/app/data/data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../controllers/about_us_controller.dart';

class AboutUsView extends GetView<AboutUsController> {
  final String content =
      "We've all been there: we need to share a super long, complicated URL with friends or colleagues, but they're just too lazy to write it down or to use up one of their precious few characters in Facebook status updates. What to do? Say hello to SOAURL- the best URL shortener and QR code generator app available on the market. Packed with awesome features, this app will help you generate stunning QR codes that can be shared via text messages, email or wherever you like.";
  final String content2 =
      'Get improved absorption of business information. We provide quick access to meaningful business insights. Vizualize Your Growth with help of graphs and pie Charts. Know how users visit your site with multiple platfroms, so that you can reach out more users.';

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
                mainIcon: Icon(
                  Icons.info_outline,
                  size: Tween<double>(begin: 0, end: 125)
                      .evaluate(appbar.getAnimation(constraints)),
                ),
                title: 'About Us')),
      ),
      isChildScrollable: true,
      child: SingleChildScrollView(
        child: Column(
          children: [
            WebsafeSvg.asset(
              'assets/images/url_illustration.svg',
              height: 100,
              fit: BoxFit.contain,
            ).py4(),
            content.text.textStyle(ktsSubHeading).make(),
            WebsafeSvg.asset(
              'assets/images/data_visualization.svg',
              height: 100,
              fit: BoxFit.contain,
            ).py4(),
            content2.text.textStyle(ktsSubHeading).make(),
            Column(
              children: [
                Text(
                  'Made with ❤ by',
                  style: ktsSubHeading,
                  textAlign: TextAlign.center,
                ),
                Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  direction: Axis.horizontal,
                  children: [
                    devProfile(
                        name: 'Ayush Kejariwal',
                        imgLink:
                            'https://avatars.githubusercontent.com/u/53415956?s=460&u=65f4b2ed95fbfb538a2c142a43e0496eb52a5078&v=4',
                        github: 'https://github.com/kejariwalayush',
                        instagram: 'https://instagram.com/a_kejariwal',
                        linkedIn: 'https://linkedin.com/kejariwalayush'),
                    devProfile(
                        name: 'Rohan Verma',
                        imgLink:
                            'https://avatars.githubusercontent.com/u/53369178?s=460&u=c05a342fd4e65cfc308328bb22787b8a25df2336&v=4',
                        github: 'https://github.com/martyminiac',
                        instagram: 'https://instagram.com/martyminiac',
                        linkedIn: 'https://linkedin.com/martyminiac'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget devProfile(
      {String name,
      String imgLink,
      String instagram,
      String github,
      String linkedIn}) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      // width: 200,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.purple,
            foregroundImage: NetworkImage(imgLink),
            maxRadius: 15,
          ),
          Text(
            name,
            overflow: TextOverflow.ellipsis,
            style: ktsSubHeading,
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (github != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: FaIcon(FontAwesomeIcons.github),
                      onPressed: () => _launchURL(github)),
                ),
              if (instagram != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: FaIcon(FontAwesomeIcons.instagram),
                      onPressed: () => _launchURL(instagram)),
                ),
              if (linkedIn != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: FaIcon(FontAwesomeIcons.linkedinIn),
                      onPressed: () => _launchURL(linkedIn)),
                ),
            ],
          ),
        ],
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
