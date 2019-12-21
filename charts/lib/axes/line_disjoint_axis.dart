import 'dart:collection' show LinkedHashMap;
import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class DisjointMeasureAxisLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  DisjointMeasureAxisLineChart(this.seriesList, {this.animate});

  factory DisjointMeasureAxisLineChart.withSampleData() {
    return new DisjointMeasureAxisLineChart(
      _createSampleData(),
      animate: false,
    );
  }

  factory DisjointMeasureAxisLineChart.withRandomData() {
    return new DisjointMeasureAxisLineChart(_createRandomData());
  }

  static List<charts.Series<LinearClicks, num>> _createRandomData() {
    final random = new Random();

    final myFakeDesktopData = [
      new LinearClicks(0, clickCount: random.nextInt(100)),
      new LinearClicks(1, clickCount: random.nextInt(100)),
      new LinearClicks(2, clickCount: random.nextInt(100)),
      new LinearClicks(3, clickCount: random.nextInt(100)),
    ];

    final myFakeTabletData = [
      new LinearClicks(0, clickCount: random.nextInt(100) * 100),
      new LinearClicks(1, clickCount: random.nextInt(100) * 100),
      new LinearClicks(2, clickCount: random.nextInt(100) * 100),
      new LinearClicks(3, clickCount: random.nextInt(100) * 100),
    ];

    final myFakeMobileData = [
      new LinearClicks(0, clickCount: random.nextInt(100) * 1000),
      new LinearClicks(1, clickCount: random.nextInt(100) * 1000),
      new LinearClicks(2, clickCount: random.nextInt(100) * 1000),
      new LinearClicks(3, clickCount: random.nextInt(100) * 1000),
    ];
    
    final myFakeClickRateData = [
      new LinearClicks(0, clickRate: .25),
      new LinearClicks(1, clickRate: .65),
      new LinearClicks(2, clickRate: .50),
      new LinearClicks(3, clickRate: .30),
    ];

    return [
      new charts.Series<LinearClicks, int>(
          id: 'Fake Series',
          domainFn: (LinearClicks clickCount, _) => clickCount.year,
          measureFn: (LinearClicks clickCount, _) => clickCount.clickCount,
          data: []),
      new charts.Series<LinearClicks, int>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearClicks clickCount, _) => clickCount.year,
        measureFn: (LinearClicks clickCount, _) => clickCount.clickCount,
        data: myFakeDesktopData,
      )
        ..setAttribute(charts.measureAxisIdKey, 'axis 1'),
      new charts.Series<LinearClicks, int>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (LinearClicks clickCount, _) => clickCount.year,
        measureFn: (LinearClicks clickCount, _) => clickCount.clickCount,
        data: myFakeTabletData,
      )
        ..setAttribute(charts.measureAxisIdKey, 'axis 2'),
      new charts.Series<LinearClicks, int>(
        id: 'Mobile',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (LinearClicks clickCount, _) => clickCount.year,
        measureFn: (LinearClicks clickCount, _) => clickCount.clickCount,
        data: myFakeMobileData,
      )
        ..setAttribute(charts.measureAxisIdKey, 'axis 3'),
      new charts.Series<LinearClicks, int>(
        id: 'Click Rate',
        colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
        domainFn: (LinearClicks clickCount, _) => clickCount.year,
        measureFn: (LinearClicks clickCount, _) => clickCount.clickCount,
        data: myFakeClickRateData,
      )
        ..setAttribute(charts.measureAxisIdKey, 'axis 4'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(seriesList,
        animate: animate,
        primaryMeasureAxis: new charts.NumericAxisSpec(
            tickProviderSpec: new charts.StaticNumericTickProviderSpec(
          <charts.TickSpec<num>>[
            new charts.TickSpec(0, label: ''),
            new charts.TickSpec(1, label: ''),
            new charts.TickSpec(2, label: ''),
            new charts.TickSpec(3, label: ''),
            new charts.TickSpec(4, label: ''),
          ],
        )),
        disjointMeasureAxes:
            new LinkedHashMap<String, charts.NumericAxisSpec>.from({
          'axis 1': new charts.NumericAxisSpec(),
          'axis 2': new charts.NumericAxisSpec(),
          'axis 3': new charts.NumericAxisSpec(),
          'axis 4': new charts.NumericAxisSpec(),
        }));
  }

  static List<charts.Series<LinearClicks, int>> _createSampleData() {
    final myFakeDesktopData = [
      new LinearClicks(0, clickCount: 25),
      new LinearClicks(1, clickCount: 125),
      new LinearClicks(2, clickCount: 920),
      new LinearClicks(3, clickCount: 375),
    ];

    final myFakeTabletData = [
      new LinearClicks(0, clickCount: 375),
      new LinearClicks(1, clickCount: 1850),
      new LinearClicks(2, clickCount: 9700),
      new LinearClicks(3, clickCount: 5000),
    ];

    final myFakeMobileData = [
      new LinearClicks(0, clickCount: 5000),
      new LinearClicks(1, clickCount: 25000),
      new LinearClicks(2, clickCount: 100000),
      new LinearClicks(3, clickCount: 75000),
    ];

    final myFakeClickRateData = [
      new LinearClicks(0, clickRate: .25),
      new LinearClicks(1, clickRate: .65),
      new LinearClicks(2, clickRate: .50),
      new LinearClicks(3, clickRate: .30),
    ];

    return [
      new charts.Series<LinearClicks, int>(
          id: 'Fake Series',
          domainFn: (LinearClicks clickCount, _) => clickCount.year,
          measureFn: (LinearClicks clickCount, _) => clickCount.clickCount,
          data: []),
      new charts.Series<LinearClicks, int>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearClicks clickCount, _) => clickCount.year,
        measureFn: (LinearClicks clickCount, _) => clickCount.clickCount,
        data: myFakeDesktopData,
      )
        ..setAttribute(charts.measureAxisIdKey, 'axis 1'),
      new charts.Series<LinearClicks, int>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (LinearClicks clickCount, _) => clickCount.year,
        measureFn: (LinearClicks clickCount, _) => clickCount.clickCount,
        data: myFakeTabletData,
      )
        ..setAttribute(charts.measureAxisIdKey, 'axis 2'),
      new charts.Series<LinearClicks, int>(
        id: 'Mobile',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (LinearClicks clickCount, _) => clickCount.year,
        measureFn: (LinearClicks clickCount, _) => clickCount.clickCount,
        data: myFakeMobileData,
      )
        ..setAttribute(charts.measureAxisIdKey, 'axis 3'),
      new charts.Series<LinearClicks, int>(
        id: 'Click Rate',
        colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
        domainFn: (LinearClicks clickCount, _) => clickCount.year,
        measureFn: (LinearClicks clickCount, _) => clickCount.clickRate,
        data: myFakeClickRateData,
      )
        ..setAttribute(charts.measureAxisIdKey, 'axis 4'),
    ];
  }
}

class LinearClicks {
  final int year;
  final int clickCount;
  final double clickRate;

  LinearClicks(this.year, {this.clickCount, this.clickRate});
}
