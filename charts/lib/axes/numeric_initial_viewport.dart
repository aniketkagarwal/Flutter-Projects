import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class NumericInitialViewport extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  NumericInitialViewport(this.seriesList, {this.animate});

  factory NumericInitialViewport.withSampleData() {
    return new NumericInitialViewport(
      _createSampleData(),
      animate: false,
    );
  }

  factory NumericInitialViewport.withRandomData() {
    return new NumericInitialViewport(_createRandomData());
  }

  static List<charts.Series<LinearSales, num>> _createRandomData() {
    final random = new Random();

    final data = [
      new LinearSales(0, random.nextInt(100)),
      new LinearSales(1, random.nextInt(100)),
      new LinearSales(2, random.nextInt(100)),
      new LinearSales(3, random.nextInt(100)),
      new LinearSales(4, random.nextInt(100)),
      new LinearSales(5, random.nextInt(100)),
      new LinearSales(6, random.nextInt(100)),
      new LinearSales(7, random.nextInt(100)),
      new LinearSales(8, random.nextInt(100)),
      new LinearSales(9, random.nextInt(100)),
      new LinearSales(10, random.nextInt(100)),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(
      seriesList,
      animate: animate,
      domainAxis: new charts.NumericAxisSpec(
          viewport: new charts.NumericExtents(3.0, 7.0)),
      behaviors: [new charts.PanAndZoomBehavior()],
    );
  }

  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 5),
      new LinearSales(1, 25),
      new LinearSales(2, 100),
      new LinearSales(3, 75),
      new LinearSales(4, 55),
      new LinearSales(5, 66),
      new LinearSales(6, 110),
      new LinearSales(7, 70),
      new LinearSales(8, 20),
      new LinearSales(9, 25),
      new LinearSales(10, 45),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
