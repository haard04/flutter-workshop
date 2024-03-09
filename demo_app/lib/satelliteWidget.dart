import 'package:flutter/material.dart';

class satelliteWidget extends StatelessWidget {
  String id;
  String country;
  String date;
  String mass;
  String launcher;
  satelliteWidget(this.id,this.country,this.date,this.mass,this.launcher,{super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text('Id is ${id}'),
                Text('Launcher - ${launcher}')
              ],
            ),
            Row(
              children: [
                Text('Country - ${country}'),
                Text('Date -  ${date}')
              ],
            ),
            Row(
              children: [
                Text('Mass- ${mass} KG'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}