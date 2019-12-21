import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class StaticallyProvidedTicks extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  StaticallyProvidedTicks(this.seriesList, {this.animate});

  factory StaticallyProvidedTicks.withSampleData() {
    return new StaticallyProvidedTicks(
      _createSampleData(),
      animate: false,
    );
  }

  factory StaticallyProvidedTicks.withRandomData() {
    return new StaticallyProvidedTicks(_createRandomData());
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
    final staticTicks = <charts.TickSpec<String>>[
      new charts.TickSpec(
          '2014',
          label: 'Year 2014',
          style: new charts.TextStyleSpec(
              color: new charts.Color(r: 0x4C, g: 0xAF, b: 0x50))),
      new charts.TickSpec('2015'),
      new charts.TickSpec('2016'),
      new charts.TickSpec('2017'),
    ];

    return new charts.BarChart(
      seriesList,
      animate: animate,
      domainAxis: new charts.OrdinalAxisSpec(
          tickProviderSpec:
              new charts.StaticOrdinalTickProviderSpec(staticTicks)),
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
