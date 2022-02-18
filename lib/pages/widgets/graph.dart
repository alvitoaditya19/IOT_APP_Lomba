import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iotapps/pages/bar/models/data_consumption.dart';
import 'package:iotapps/pages/bar/widgets/data_cart.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Graph extends StatelessWidget {
  final double dataInGb1;
  final double dataInGb2;
  final double dataInGb3;
  final double dataInGb4;

  Graph({
    this.dataInGb1,
    this.dataInGb2,
    this.dataInGb3,
    this.dataInGb4,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 590,
        width: 340,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.5,
            color: Colors.white.withOpacity(0.1),
          ),
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        child: Column(children: <Widget>[
          SizedBox(height: 10),
          Text("Graph Data",
              style: GoogleFonts.openSans().copyWith(
                  color: Color(0xFF152C5B),
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0)),
          SizedBox(height: 10),
          DataChart(
            data: [
              DataConsumption(
                month: 'LI',
                dataInGb: dataInGb1,
                /* snapshot
                                      .data.snapshot.value["cahaya"]
                                      .toDouble(),*/
                barColor: charts.ColorUtil.fromDartColor(Colors.blue),
              ),
              DataConsumption(
                month: 'CT',
                dataInGb: dataInGb2,
                /*snapshot
                                      .data.snapshot.value["suhuc"]
                                      .toDouble(),*/
                barColor: charts.ColorUtil.fromDartColor(Colors.deepPurple),
              ),
              DataConsumption(
                month: 'FT',
                dataInGb: dataInGb2,
                /*snapshot
                                      .data.snapshot.value["suhuf"]
                                      .toDouble(),*/
                barColor: charts.ColorUtil.fromDartColor(Colors.green),
              ),
              DataConsumption(
                month: 'Humidity',
                dataInGb: dataInGb3,
                /*snapshot
                                      .data.snapshot.value["udara"]
                                      .toDouble(),*/
                barColor: charts.ColorUtil.fromDartColor(Colors.yellow),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 10),
              Container(
                height: 20.0,
                width: 20.0,
                decoration: new BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              SizedBox(width: 10),
              Text("Light Intensity",
                  style: GoogleFonts.openSans().copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0)),
              SizedBox(width: 10),
              Container(
                height: 20.0,
                width: 20.0,
                decoration: new BoxDecoration(
                  color: Colors.green,
                ),
              ),
              SizedBox(width: 10),
              Text("Fahrenheit\nTemperature",
                  style: GoogleFonts.openSans().copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 10),
              Container(
                height: 20.0,
                width: 20.0,
                decoration: new BoxDecoration(
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(width: 10),
              Text("Celcius\nTemperature",
                  style: GoogleFonts.openSans().copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0)),
              SizedBox(width: 10),
              Container(
                height: 20.0,
                width: 20.0,
                decoration: new BoxDecoration(
                  color: Colors.yellow,
                ),
              ),
              SizedBox(width: 10),
              Text("Humidity",
                  style: GoogleFonts.openSans().copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0)),
            ],
          ),
        ]),
      ),
    );
  }
}
