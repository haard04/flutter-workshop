import 'package:demo_app/satelliteWidget.dart';
import 'package:demo_app/service.dart';
import 'package:flutter/material.dart';
import './model.dart';

class SatelliteList extends StatelessWidget {
  List<Satellites> satellites;
   SatelliteList(this.satellites,{Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(title: Text('Satellites')),
      body: Container(
        child:SingleChildScrollView(
         physics: const AlwaysScrollableScrollPhysics(), 
         child: Column(
          children: [

            for(int i=0;i<satellites.length;i++)
            satelliteWidget(satellites[i].id,satellites[i].country,satellites[i].date,satellites[i].mass,satellites[i].launcher),
            
            
            

            
          ],
        ),
        )
        
      ),
    );
  }
}