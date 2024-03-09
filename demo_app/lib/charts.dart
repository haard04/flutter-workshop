import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:demo_app/model.dart'; // Import your model file here

class Charts extends StatelessWidget {


  Charts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DataSchema> chartData = [
      DataSchema(index: '2021',value: 10),
      DataSchema(index: '2022',value: 18),
      DataSchema(index: '2023',value: 11),
      DataSchema(index: '2024',value: 12),
      DataSchema(index: '2025',value: 15),

    ];

    return Scaffold(
      appBar: AppBar(title: Text('Chart')),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: SfCartesianChart(
              
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(),
                series: <LineSeries<DataSchema, String>>[
                  LineSeries<DataSchema, String>(
                    dataSource: chartData,
                    xValueMapper: (DataSchema data, _) => data.index.toString(),
                    yValueMapper: (DataSchema data, _) => data.value,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
class DataSchema {
  final String index;
  final double value;

  DataSchema({required this.index, required this.value});
}