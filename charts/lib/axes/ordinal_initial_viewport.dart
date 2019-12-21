import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class OrdinalInitialViewport extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  OrdinalInitialViewport(this.seriesList, {this.animate});

  factory OrdinalInitialViewport.withSampleData() {
    return new OrdinalInitialViewport(
      _createSampleData(),
      animate: false,
    );
  }

  factory OrdinalInitialViewport.withRandomData() {
    return new OrdinalInitialViewport(_createRandomData());
  }

  static List<charts.Series<OrdinalSales, String>> _createRandomData() {
    final random = new Random();

    final data = [
      new OrdinalSales('2014', random.nextInt(100)),
      new OrdinalSales('2015', random.nextInt(100)),
      new OrdinalSales('2016', random.nextInt(100)),
      new OrdinalSales('2017', random.nextInt(100)),
      new OrdinalSales('2018', random.nextInt(100)),
      new OrdinalSales('2019', random.nextInt(100)),
      new OrdinalSales('2020', random.nextInt(100)),
      new OrdinalSales('2021', random.nextInt(100)),
      new OrdinalSales('2022', random.nextInt(100)),
      new OrdinalSales('2023', random.nextInt(100)),
      new OrdinalSales('2024', random.nextInt(100)),
      new OrdinalSales('2025', random.nextInt(100)),
      new OrdinalSales('2026', random.nextInt(100)),
      new OrdinalSales('2027', random.nextInt(100)),
      new OrdinalSales('2028', random.nextInt(100)),
      new OrdinalSales('2029', random.nextInt(100)),
      new OrdinalSales('2030', random.nextInt(100)),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      domainAxis: new charts.OrdinalAxisSpec(
          viewport: new charts.OrdinalViewport('2018', 4)),
      behaviors: [new charts.PanAndZoomBehavior()],
    );
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
      new OrdinalSales('2018', 33),
      new OrdinalSales('2019', 80),
      new OrdinalSales('2020', 21),
      new OrdinalSales('2021', 77),
      new OrdinalSales('2022', 8),
      new OrdinalSales('2023', 12),
      new OrdinalSales('2024', 42),
      new OrdinalSales('2025', 70),
      new OrdinalSales('2026', 77),
      new OrdinalSales('2027', 55),
      new OrdinalSales('2028', 19),
      new OrdinalSales('2029', 66),
      new OrdinalSales('2030', 27),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
