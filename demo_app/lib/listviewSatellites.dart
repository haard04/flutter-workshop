import 'package:demo_app/satelliteWidget.dart';
import 'package:demo_app/service.dart';
import 'package:flutter/material.dart';
import './model.dart';

class SatelliteListView extends StatelessWidget {
  List<Satellites> satellites;
   SatelliteListView(this.satellites,{Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(title: Text('Satellites via List View')),
      body: Container(
        child:SingleChildScrollView(
         physics: const AlwaysScrollableScrollPhysics(), 
         child: Column(
          children: [
            ListView.builder( 
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
              
                return satelliteWidget(
                   satellites[index].id,satellites[index].country,satellites[index].date,satellites[index].mass,satellites[index].launcher,
                );
              }, itemCount: satellites.length),
            
            
            

            
          ],
        ),
        )
        
      ),
    );
  }
}