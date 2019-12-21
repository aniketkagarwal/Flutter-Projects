import 'package:flutter/material.dart';
import '../gallery_scaffold.dart';
import 'domain_a11y_explore_bar_chart.dart';

List<GalleryScaffold> buildGallery() {
  return [
    new GalleryScaffold(
      listTileIcon: new Icon(Icons.accessibility),
      title: 'Screen reader enabled bar chart',
      subtitle: 'Requires TalkBack or Voiceover turned on to work. '
          'Bar chart with domain selection explore mode behavior.',
      childBuilder: () => new DomainA11yExploreBarChart.withRandomData(),
    ),
  ];
}
