import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class DomainA11yExploreBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  DomainA11yExploreBarChart(this.seriesList, {this.animate});

  factory DomainA11yExploreBarChart.withSampleData() {
    return new DomainA11yExploreBarChart(
      _createSampleData(),
      animate: false,
    );
  }

  factory DomainA11yExploreBarChart.withRandomData() {
    return new DomainA11yExploreBarChart(_createRandomData());
  }

  static List<charts.Series<OrdinalSales, String>> _createRandomData() {
    final random = new Random();

    final mobileData = [
      new OrdinalSales('2014', random.nextInt(100)),
      new OrdinalSales('2015', random.nextInt(100)),
      new OrdinalSales('2016', random.nextInt(100)),
      new OrdinalSales('2017', random.nextInt(100)),
    ];

    final tabletData = [
      new OrdinalSales('2016', random.nextInt(100)),
      new OrdinalSales('2017', random.nextInt(100)),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Mobile Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Tablet Sales',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tabletData,
      )
    ];
  }

  String vocalizeDomainAndMeasures(List<charts.SeriesDatum> seriesDatums) {
    final buffer = new StringBuffer();

    buffer.write(seriesDatums.first.datum.year);

    for (charts.SeriesDatum seriesDatum in seriesDatums) {
      final series = seriesDatum.series;
      final datum = seriesDatum.datum;

      buffer.write(' ${series.displayName} '
          '${datum.sales / 1000} thousand dollars');
    }

    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    return new Semantics(
        label: 'Yearly sales bar chart',
        hint: 'Press and hold to enable explore',
        child: new charts.BarChart(
          seriesList,
          animate: animate,
          defaultInteractions: !MediaQuery.of(context).accessibleNavigation,
          behaviors: [
            new charts.DomainA11yExploreBehavior(
              vocalizationCallback: vocalizeDomainAndMeasures,
              exploreModeTrigger: charts.ExploreModeTrigger.pressHold,
              exploreModeEnabledAnnouncement: 'Explore mode enabled',
              exploreModeDisabledAnnouncement: 'Explore mode disabled',
              minimumWidth: 1.0,
            ),
            new charts.DomainHighlighter(charts.SelectionModelType.info),
          ],
        ));
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final mobileData = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
    ];

    final tabletData = [
      new OrdinalSales('2016', 25),
      new OrdinalSales('2017', 50),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Mobile Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Tablet Sales',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tabletData,
      )
    ];
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
