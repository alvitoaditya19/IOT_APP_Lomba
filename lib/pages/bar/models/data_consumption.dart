import 'dart:ffi';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class DataConsumption {
  final String month;
  final double dataInGb;
  final charts.Color barColor;

  DataConsumption(
      {@required this.month, @required this.dataInGb, @required this.barColor});
}
