import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ShortTickLengthAxis extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  ShortTickLengthAxis(this.seriesList, {this.animate});

  factory ShortTickLengthAxis.withSampleData() {
    return new ShortTickLengthAxis(
      _createSampleData(),
      animate: false,
    );
  }
  factory ShortTickLengthAxis.withRandomData() {
    return new ShortTickLengthAxis(_createRandomData());
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
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      primaryMeasureAxis: new charts.NumericAxisSpec(
          renderSpec: new charts.SmallTickRendererSpec(
              )),
    );
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final globalSalesData = [
      new OrdinalSales('2014', 5000),
      new OrdinalSales('2015', 25000),
      new OrdinalSales('2016', 100000),
      new OrdinalSales('2017', 750000),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Global Revenue',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: globalSalesData,
      ),
    ];
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
