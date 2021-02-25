import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatelessWidget {
  Splash({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(1.0, -1.0),
            end: Alignment(-1.0, 1.0),
            colors: [const Color(0xffc651cd), const Color(0xff441d7d)],
            stops: [0.0, 1.0],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  // height: MediaQuery.of(context).size.height * 0.5,
                  child: SvgPicture.asset(
                'assets/images/logo.svg',
                height: 500,
              )),
              // SizedBox(
              //   height: 10,
              // ),
              Text(
                'SOAUrl',
                style: TextStyle(
                  fontFamily: 'Sitka Text',
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
            ],
          ),
        ),
      ),
    );
  }
}
