import 'package:demo_app/charts.dart';
import 'package:demo_app/listviewSatellites.dart';
import 'package:demo_app/model.dart';
import 'package:demo_app/satelliteWidget.dart';
import 'package:demo_app/satellites.dart';
import 'package:demo_app/service.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';


class Home extends StatelessWidget {
   Home({Key? key}) : super(key: key);

  TextEditingController fieldTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String city='';
     double latitude=0;
     double longitude=0;


     GeolocatorPlatform geolocator = GeolocatorPlatform.instance;

       Future getUserLocation() async {
    try {
      Position userLocation = await geolocator.getCurrentPosition();
      latitude = userLocation.latitude;
      longitude = userLocation.longitude;

      print("Latitude: $latitude, Longitude: $longitude");
      

      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      print(placemarks[0].subLocality);
      city = placemarks[0].locality.toString();
      print(city);
      print(placemarks[0].country);
      print(placemarks[0].postalCode);
      return city;



    } catch (e) {
      // Handle errors, such as when the user denies location permission.
      print("Error getting location: $e");
      throw e;
    }
  }

   


    String fieldText ;
    fieldText= fieldTextController.text;
    fieldTextController.selection = TextSelection.collapsed(offset: fieldText.length);



    return Scaffold(
      appBar: AppBar(title: Text('Hello',style: TextStyle(),),),
      body: Container(
        child: Column(
          children: 
        [
          Row(
            children: [
              Container(
                height: 120,
                width: 250,
                child: TextField(
                        maxLines: 1,
                        controller: fieldTextController,
                        onChanged: (text)=>{
                          fieldText = text
                        },
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                    
                        decoration: InputDecoration(
                          hintText: 'Enter  Name',
                          hintStyle: TextStyle(color: Colors.black),
                          counterText: ''
                        ),   
                    ),
              ),
            ],
          ),
          Row(
            children: [
              ElevatedButton(onPressed: ()async{

                List<Satellites> satellites = [];
                satellites= await fetchSatellites();
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
                Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) =>  SatelliteList(satellites)),(Route<dynamic> route) => false,
        );
              }, child: Text('Loop'))
            ],
          ),
          Row(
            children: [
              ElevatedButton(onPressed: ()async{

                List<Satellites> satellites = [];
                satellites= await fetchSatellites();
                 Navigator.push(context, MaterialPageRoute(builder: (context) => SatelliteListView(satellites),));
               
              }, child: Text('ListView'))
            ],
          ),
          Row(
            children: [
              ElevatedButton(onPressed: ()async{

                 Navigator.push(context, MaterialPageRoute(builder: (context) => Charts(),));
               
              }, child: Text('Charts'))
            ],
          ),
          Row(
            children: [
              Icon(Icons.calculate)
            ],
          ),
          Row(
            children: [
              IconButton(onPressed: (){
                const snackBar = SnackBar(
          content: Text('Snack created successfully'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }, icon: Icon(Icons.lock_clock_rounded)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onDoubleTap: () {
                  AwesomeDialog(
          context: context,
          animType: AnimType.scale,
          dialogType: DialogType.info,
          title: 'Title here',
          desc:   'This is description  ',
          btnOkOnPress: () {},
        ).show();
                },
                child:Icon(Icons.abc)
              )
            ],
          ),
          Row(
            children: [
              ElevatedButton(onPressed: ()async{
                await getUserLocation();

              }, child: Text('Location'))
            ],
          )
        ]),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.brown,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('data'),
            ),
            Text('qqww')
          ],
        ),
      ),
    );
  }
}