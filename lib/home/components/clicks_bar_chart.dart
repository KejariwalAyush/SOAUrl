import 'dart:async';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:soaurl/models/url_details.dart';

class ClicksBarChart extends StatefulWidget {
  final List<Color> availableColors = [
    Colors.purpleAccent,
    Colors.purple,
    Colors.deepPurple,
    Colors.deepPurpleAccent,
  ];
  final List<Stat> stats;

  ClicksBarChart({Key key, @required this.stats}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ClicksBarChartState();
}

class ClicksBarChartState extends State<ClicksBarChart> {
  final Color barBackgroundColor = const Color(0xff845bef);
  final Duration animDuration = const Duration(milliseconds: 250);
  double m = 0, tu = 0, w = 0, th = 0, f = 0, st = 0, su = 0;
  List<DateTime> dates;
  int touchedIndex;

  bool isPlaying = false;
  @override
  void initState() {
    dates = List.generate(7, (index) => DateTime.now());
    for (var stat in widget.stats) {
      if (stat.time.day == DateTime.monday) m += 1;
      if (stat.time.day == DateTime.tuesday) tu += 1;
      if (stat.time.day == DateTime.wednesday) w += 1;
      if (stat.time.day == DateTime.thursday) th += 1;
      if (stat.time.day == DateTime.friday) f += 1;
      if (stat.time.day == DateTime.saturday) st += 1;
      if (stat.time.day == DateTime.sunday) su += 1;
    }
    for (var stat in widget.stats) {
      if (stat.time.day == DateTime.monday) dates[0] = stat.time;
      if (stat.time.day == DateTime.tuesday) dates[1] = stat.time;
      if (stat.time.day == DateTime.wednesday) dates[2] = stat.time;
      if (stat.time.day == DateTime.thursday) dates[3] = stat.time;
      if (stat.time.day == DateTime.friday) dates[4] = stat.time;
      if (stat.time.day == DateTime.saturday) dates[5] = stat.time;
      if (stat.time.day == DateTime.sunday) dates[6] = stat.time;
    }
    print(dates.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        color: Colors.transparent, // const Color(0xff845bef),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    'Total Clicks -> ${widget.stats.length}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Daily Clicks',
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: BarChart(
                        isPlaying ? randomData() : mainBarData(),
                        swapAnimationDuration: animDuration,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.deepPurpleAccent,
                  ),
                  onPressed: () {
                    setState(() {
                      isPlaying = !isPlaying;
                      if (isPlaying) {
                        refreshState();
                      }
                    });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.white,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          colors: isTouched ? [Colors.yellow] : [barColor],
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 20,
            colors: [barBackgroundColor],
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, m, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, tu, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, w, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, th, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, f, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, st, isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, su, isTouched: i == touchedIndex);
          default:
            return null;
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.purple,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = DateFormat.MEd().format(dates[0]);
                  break;
                case 1:
                  weekDay = DateFormat.MEd().format(dates[1]);
                  break;
                case 2:
                  weekDay = DateFormat.MEd().format(dates[2]);
                  break;
                case 3:
                  weekDay = DateFormat.MEd().format(dates[3]);
                  break;
                case 4:
                  weekDay = DateFormat.MEd().format(dates[4]);
                  break;
                case 5:
                  weekDay = DateFormat.MEd().format(dates[5]);
                  break;
                case 6:
                  weekDay = DateFormat.MEd().format(dates[6]);
                  break;
              }
              return BarTooltipItem(weekDay + '\n' + (rod.y - 1).toString(),
                  TextStyle(color: Colors.white));
            }),
        touchCallback: (barTouchResponse) {
          setState(() {
            if (barTouchResponse.spot != null &&
                barTouchResponse.touchInput is! FlPanEnd &&
                barTouchResponse.touchInput is! FlLongPressEnd) {
              touchedIndex = barTouchResponse.spot.touchedBarGroupIndex;
            } else {
              touchedIndex = -1;
            }
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 16,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'M';
              case 1:
                return 'T';
              case 2:
                return 'W';
              case 3:
                return 'T';
              case 4:
                return 'F';
              case 5:
                return 'S';
              case 6:
                return 'S';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
    );
  }

  BarChartData randomData() {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 16,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'M';
              case 1:
                return 'T';
              case 2:
                return 'W';
              case 3:
                return 'T';
              case 4:
                return 'F';
              case 5:
                return 'S';
              case 6:
                return 'S';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          case 1:
            return makeGroupData(1, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          case 2:
            return makeGroupData(2, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          case 3:
            return makeGroupData(3, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          case 4:
            return makeGroupData(4, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          case 5:
            return makeGroupData(5, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          case 6:
            return makeGroupData(6, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          default:
            return null;
        }
      }),
    );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
        animDuration + const Duration(milliseconds: 50));
    if (isPlaying) {
      refreshState();
    }
  }
}
