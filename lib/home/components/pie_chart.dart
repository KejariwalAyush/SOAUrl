import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:soaurl/models/url_details.dart';

/// Icons by svgrepo.com (https://www.svgrepo.com/collection/job-and-professions-3/)
class DevicePieChart extends StatefulWidget {
  final List<Stat> stats;

  const DevicePieChart({Key key, @required this.stats}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _DevicePieChartState();
}

class _DevicePieChartState extends State<DevicePieChart> {
  int touchedIndex, totalClicks = 0;
  double android = 0, desktop = 0, others = 0, iphone = 0;

  @override
  void initState() {
    for (var stat in widget.stats) {
      totalClicks++;
      if (stat.deviceType == 'windows' || stat.deviceType == 'mac')
        desktop++;
      else if (stat.deviceType == 'android')
        android++;
      else if (stat.deviceType == 'iphone')
        iphone++;
      else
        others++;
    }
    desktop = desktop / totalClicks * 100;
    android = android / totalClicks * 100;
    iphone = iphone / totalClicks * 100;
    others = others / totalClicks * 100;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // List<Stat> _stats = widget.stats;
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        color: Colors.transparent,
        child: AspectRatio(
          aspectRatio: 1,
          child: PieChart(
            PieChartData(
                pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                  setState(() {
                    if (pieTouchResponse.touchInput is FlLongPressEnd ||
                        pieTouchResponse.touchInput is FlPanEnd) {
                      touchedIndex = -1;
                    } else {
                      touchedIndex = pieTouchResponse.touchedSectionIndex;
                    }
                  });
                }),
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0,
                centerSpaceRadius: 0,
                sections: showingSections()),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 20 : 16;
      final double radius = isTouched ? 110 : 100;
      final double widgetSize = isTouched ? 55 : 40;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: desktop,
            title: isTouched
                ? '${desktop * totalClicks / 100} Clicks'
                : '${desktop.toInt()}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
            badgeWidget: _Badge(
              Icons.laptop,
              size: widgetSize,
              borderColor: const Color(0xff0293ee),
            ),
            badgePositionPercentageOffset: .98,
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: android,
            title: isTouched
                ? '${android * totalClicks / 100} Clicks'
                : '${android.toInt()}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
            badgeWidget: _Badge(
              Icons.phone_iphone,
              size: widgetSize,
              borderColor: const Color(0xfff8b250),
            ),
            badgePositionPercentageOffset: .98,
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: iphone,
            title: isTouched
                ? '${iphone * totalClicks / 100} Clicks'
                : '${iphone.toInt()}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
            badgeWidget: _Badge(
              Icons.phone_android_rounded,
              size: widgetSize,
              borderColor: const Color(0xff845bef),
            ),
            badgePositionPercentageOffset: .98,
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: others,
            title: isTouched
                ? '${others * totalClicks / 100} Clicks'
                : '${others.toInt()}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
            badgeWidget: _Badge(
              Icons.devices_other,
              size: widgetSize,
              borderColor: const Color(0xff13d38e),
            ),
            badgePositionPercentageOffset: .98,
          );
        default:
          return null;
      }
    });
  }
}

class _Badge extends StatelessWidget {
  final IconData icons;
  final double size;
  final Color borderColor;

  const _Badge(
    this.icons, {
    Key key,
    @required this.size,
    @required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
          child: Icon(
        icons,
      )),
    );
  }
}
