import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class MeasureAxisLabelAlignment extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  MeasureAxisLabelAlignment(this.seriesList, {this.animate});

  factory MeasureAxisLabelAlignment.withSampleData() {
    return new MeasureAxisLabelAlignment(
      _createSampleData(),
      animate: false,
    );
  }

  factory MeasureAxisLabelAlignment.withRandomData() {
    return new MeasureAxisLabelAlignment(_createRandomData());
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
          renderSpec: new charts.GridlineRendererSpec(
        labelAnchor: charts.TickLabelAnchor.before,
        labelJustification: charts.TickLabelJustification.outside,
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
