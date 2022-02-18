import 'package:iotapps/pages/bar/models/data_consumption.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DataChart extends StatelessWidget {
  final List<DataConsumption> data;

  const DataChart({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<charts.Series<DataConsumption, String>> series = [
      charts.Series(
        data: data,
        id: "DataConsumption",
        domainFn: (DataConsumption series, _) => series.month,
        measureFn: (DataConsumption series, _) => series.dataInGb,
        colorFn: (DataConsumption seies, _) => seies.barColor,
      )
    ];
    return Container(
      height: 430,
      width: 700,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Column(
          children: <Widget>[
            Text(
              "Data Set of Our Output",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Expanded(
              child: charts.BarChart(
                series,
                animate: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
