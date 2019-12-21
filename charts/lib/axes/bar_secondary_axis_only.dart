import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BarChartWithSecondaryAxisOnly extends StatelessWidget {
  static const secondaryMeasureAxisId = 'secondaryMeasureAxisId';
  final List<charts.Series> seriesList;
  final bool animate;

  BarChartWithSecondaryAxisOnly(this.seriesList, {this.animate});

  factory BarChartWithSecondaryAxisOnly.withSampleData() {
    return new BarChartWithSecondaryAxisOnly(
      _createSampleData(),
      animate: false,
    );
  }

  factory BarChartWithSecondaryAxisOnly.withRandomData() {
    return new BarChartWithSecondaryAxisOnly(_createRandomData());
  }

  static List<charts.Series<OrdinalSales, String>> _createRandomData() {
    final random = new Random();

    final globalSalesData = [
      new OrdinalSales('2014', random.nextInt(100) * 100),
      new OrdinalSales('2015', random.nextInt(100) * 100),
      new OrdinalSales('2016', random.nextInt(100) * 100),
      new OrdinalSales('2017', random.nextInt(100) * 100),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Global Revenue',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: globalSalesData,
      )
        ..setAttribute(charts.measureAxisIdKey, secondaryMeasureAxisId),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
    );
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final globalSalesData = [
      new OrdinalSales('2014', 500),
      new OrdinalSales('2015', 2500),
      new OrdinalSales('2016', 1000),
      new OrdinalSales('2017', 7500),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Global Revenue',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: globalSalesData,
      )
        ..setAttribute(charts.measureAxisIdKey, secondaryMeasureAxisId),
    ];
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
