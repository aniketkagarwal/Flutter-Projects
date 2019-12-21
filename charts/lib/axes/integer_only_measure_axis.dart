import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class IntegerOnlyMeasureAxis extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  IntegerOnlyMeasureAxis(this.seriesList, {this.animate});

  factory IntegerOnlyMeasureAxis.withSampleData() {
    return new IntegerOnlyMeasureAxis(
      _createSampleData(),
      animate: false,
    );
  }
  factory IntegerOnlyMeasureAxis.withRandomData() {
    return new IntegerOnlyMeasureAxis(_createRandomData());
  }

  static List<charts.Series<MyRow, DateTime>> _createRandomData() {
    final random = new Random();

    final data = [
      new MyRow(new DateTime(2017, 9, 25), random.nextDouble().round()),
      new MyRow(new DateTime(2017, 9, 26), random.nextDouble().round()),
      new MyRow(new DateTime(2017, 9, 27), random.nextDouble().round()),
      new MyRow(new DateTime(2017, 9, 28), random.nextDouble().round()),
      new MyRow(new DateTime(2017, 9, 29), random.nextDouble().round()),
      new MyRow(new DateTime(2017, 9, 30), random.nextDouble().round()),
      new MyRow(new DateTime(2017, 10, 01), random.nextDouble().round()),
      new MyRow(new DateTime(2017, 10, 02), random.nextDouble().round()),
      new MyRow(new DateTime(2017, 10, 03), random.nextDouble().round()),
      new MyRow(new DateTime(2017, 10, 04), random.nextDouble().round()),
      new MyRow(new DateTime(2017, 10, 05), random.nextDouble().round()),
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
    return new charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      primaryMeasureAxis: new charts.NumericAxisSpec(
          tickProviderSpec: new charts.BasicNumericTickProviderSpec(
              dataIsInWholeNumbers: true,
              desiredTickCount: 5)),
    );
  }

  static List<charts.Series<MyRow, DateTime>> _createSampleData() {
    final data = [
      new MyRow(new DateTime(2017, 9, 25), 0),
      new MyRow(new DateTime(2017, 9, 26), 0),
      new MyRow(new DateTime(2017, 9, 27), 0),
      new MyRow(new DateTime(2017, 9, 28), 0),
      new MyRow(new DateTime(2017, 9, 29), 0),
      new MyRow(new DateTime(2017, 9, 30), 0),
      new MyRow(new DateTime(2017, 10, 01), 1),
      new MyRow(new DateTime(2017, 10, 02), 1),
      new MyRow(new DateTime(2017, 10, 03), 1),
      new MyRow(new DateTime(2017, 10, 04), 1),
      new MyRow(new DateTime(2017, 10, 05), 1),
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
