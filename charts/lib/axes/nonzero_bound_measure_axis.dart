import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class NonzeroBoundMeasureAxis extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  NonzeroBoundMeasureAxis(this.seriesList, {this.animate});

  factory NonzeroBoundMeasureAxis.withSampleData() {
    return new NonzeroBoundMeasureAxis(
      _createSampleData(),
      animate: false,
    );
  }

  factory NonzeroBoundMeasureAxis.withRandomData() {
    return new NonzeroBoundMeasureAxis(_createRandomData());
  }

  static List<charts.Series<MyRow, DateTime>> _createRandomData() {
    final random = new Random();

    final data = [
      new MyRow(new DateTime(2017, 9, 25), random.nextInt(100) + 100),
      new MyRow(new DateTime(2017, 9, 26), random.nextInt(100) + 100),
      new MyRow(new DateTime(2017, 9, 27), random.nextInt(100) + 100),
      new MyRow(new DateTime(2017, 9, 28), random.nextInt(100) + 100),
      new MyRow(new DateTime(2017, 9, 29), random.nextInt(100) + 100),
      new MyRow(new DateTime(2017, 9, 30), random.nextInt(100) + 100),
      new MyRow(new DateTime(2017, 10, 01), random.nextInt(100) + 100),
      new MyRow(new DateTime(2017, 10, 02), random.nextInt(100) + 100),
      new MyRow(new DateTime(2017, 10, 03), random.nextInt(100) + 100),
      new MyRow(new DateTime(2017, 10, 04), random.nextInt(100) + 100),
      new MyRow(new DateTime(2017, 10, 05), random.nextInt(100) + 100),
    ];

    return [
      new charts.Series<MyRow, DateTime>(
        id: 'Headcount',
        domainFn: (MyRow row, _) => row.timeStamp,
        measureFn: (MyRow row, _) => row.headcount,
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(seriesList,
        animate: animate,
        primaryMeasureAxis: new charts.NumericAxisSpec(
            tickProviderSpec:
                new charts.BasicNumericTickProviderSpec(zeroBound: false)));
  }

  static List<charts.Series<MyRow, DateTime>> _createSampleData() {
    final data = [
      new MyRow(new DateTime(2017, 9, 25), 106),
      new MyRow(new DateTime(2017, 9, 26), 108),
      new MyRow(new DateTime(2017, 9, 27), 106),
      new MyRow(new DateTime(2017, 9, 28), 109),
      new MyRow(new DateTime(2017, 9, 29), 111),
      new MyRow(new DateTime(2017, 9, 30), 115),
      new MyRow(new DateTime(2017, 10, 01), 125),
      new MyRow(new DateTime(2017, 10, 02), 133),
      new MyRow(new DateTime(2017, 10, 03), 127),
      new MyRow(new DateTime(2017, 10, 04), 131),
      new MyRow(new DateTime(2017, 10, 05), 123),
    ];

    return [
      new charts.Series<MyRow, DateTime>(
        id: 'Headcount',
        domainFn: (MyRow row, _) => row.timeStamp,
        measureFn: (MyRow row, _) => row.headcount,
        data: data,
      )
    ];
  }
}

class MyRow {
  final DateTime timeStamp;
  final int headcount;
  MyRow(this.timeStamp, this.headcount);
}
