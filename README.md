# flutter-workshop

1) Create Git Repo
2) Clone Git Repo
3) View -> Command paleatte (ctrl+shift+p)  ->  Flutter: New Project -> Application -> Name
4) ``flutter run`` for Running App
5) r, R,q  commands
6) in Main.dart -> Remove HomePage Widget
7) create home.dart , stateless widget
8) ``` <dart>
   primarySwatch: Colors.blue
   ```


9) scaffold, appbar, Text, style- textstyle, font size, 
10) Container ,column , row
11) Textfied
    ``` <dart>
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
    ```
    
    
13) Elevated Button, Naviagator
    ```<dart>
    ElevatedButton(onPressed: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
                Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) =>  Home()),(Route<dynamic> route) => false,
        );
              }, child: Text('Button'))
    ```
14) Icon
    ```<dart>
     Icon(Icons.calculate)
    ```
16) Icon Button
    ```
    IconButton(onPressed: (){}, icon: Icon(Icons.lock_clock_rounded))
    ```
16) Gester detecter
    ```
    GestureDetector(
                onDoubleTap: () {
                  
                },
                child:Icon(Icons.abc)
              )
    ```
18) Alignment
    ```
    mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
    ```
19) padding
20) Bottom Navbar
    ```<dart>
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
    ```
22) Sizer
    ```
    sizer: ^2.0.15
    ```
    ```
    return Sizer(builder: (context, orientation, deviceType) {
    return
       MaterialApp(
    )})
    ```
23) Awesome dialogue box
    ```<dart>
    awesome_dialog: ^3.0.2
    ```
    ```
      
    import 'package:awesome_dialog/awesome_dialog.dart';
    AwesomeDialog(
          context: context,
          animType: AnimType.scale,
          dialogType: DialogType.info,
          title: 'Title here',
          desc:   'This is description  ',
          btnOkOnPress: () {},
        ).show();
    ```
24) Snackbar
    ```
    const snackBar = SnackBar(
          content: Text('Snack created successfully'),
        );
    ```
25) Creating a Model for API
    ```
    https://isro.vercel.app/api/customer_satellites
    ```
26) Creating Model.dart
    ```
    
         class Satellites{
           late String id;
           late String country;
           late String date;
           late String mass;
           late String launcher;
         
         
         Satellites({
           required this.id,
           required this.country,
           required this.date,
           required this.mass,
           required this.launcher
         });
         
         }

   ```
```
27) creating a Widget
    ```<dart>
       import 'package:flutter/material.dart';

      class satelliteWidget extends StatelessWidget {
        satelliteWidget({super.key});
      
        @override
        Widget build(BuildContext context) {
          return Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Id'),
                    Text('Launcher')
                  ],
                ),
                Row(
                  children: [
                    Text('Country'),
                    Text('Date')
                  ],
                ),
                Row(
                  children: [
                    Text('Mass'),
                  ],
                ),
              ],
            ),
          );
        }
      }
   ```
```
28) Create Page with 5-10 widgets
29) Use of singlechild scroll view
30) Passing params into widget
    ```<dart>
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
    ```
31) Creating service
    ```
    http: ^0.13.3
    ```
    ```
    flutter pub get
    ```
    ```
      for(int i=0;i<satellites.length;i++)
            satelliteWidget(satellites[i].id,satellites[i].country,satellites[i].date,satellites[i].mass,satellites[i].launcher),
    ```
    ```
       import 'dart:convert';

      import 'package:demo_app/model.dart';
      import 'package:http/http.dart' as http;
      
      Future<List<Satellites>> fetchSatellites() async {
        final response = await http.get(Uri.parse('https://isro.vercel.app/api/customer_satellites'));
      
        if (response.statusCode == 200) {
          List<Satellites> satellitesList = [];
          List<dynamic> data = json.decode(response.body)['customer_satellites'];
          data.forEach((satellite) {
            satellitesList.add(Satellites.fromJson(satellite));
          });
          return satellitesList;
        } else {
          throw Exception('Failed to load satellites');
        }
      }
   ```
   ```

      class Satellites{
        late String id;
        late String country;
        late String date;
        late String mass;
        late String launcher;
      
      
      Satellites({
        required this.id,
        required this.country,
        required this.date,
        required this.mass,
        required this.launcher
      });
      
       factory Satellites.fromJson(Map<String, dynamic> json) {
          return Satellites(
            id: json['id'],
            country: json['country'],
            date: json['launch_date'],
            mass: json['mass'],
            launcher: json['launcher'],
          );
        }
      
      }
   ```
```
31) List View
    ```
       ListView.builder( 
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
              
                return satelliteWidget(
                   satellites[index].id,satellites[index].country,satellites[index].date,satellites[index].mass,satellites[index].launcher,
                );
              }, itemCount: satellites.length),
    ```
32) Syncfusion chart
    ```
    https://pub.dev/packages/syncfusion_flutter_charts
    ```
    ```
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
    ```
    ```
    ```
    33)   syncfusion_flutter_charts: ^21.1.37```
    34)   Permission Handler
        ```
         https://pub.dev/packages/geolocator
         ```
         ```
  geolocator: ^10.1.0
         ```
Android -> gradle.properties
   ```
android.useAndroidX=true
android.enableJetifier=true
```
android/app/build.gradle
```
android {
  compileSdkVersion 33

  ...
}
```
Android->app->src->main-> androidmanifest.xml
```
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
```

main.dart
```

WidgetsFlutterBinding.ensureInitialized();
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      print('Give Location');
  }
  }
```
function to get lat and long 
```
     double latitude=0;
     double longitude=0;


     GeolocatorPlatform geolocator = GeolocatorPlatform.instance;

       Future getUserLocation() async {
    try {
      Position userLocation = await geolocator.getCurrentPosition();
      latitude = userLocation.latitude;
      longitude = userLocation.longitude;

      print("Latitude: $latitude, Longitude: $longitude");
```
35) Geocoding
    ```
      geocoding: ^2.1.0
    ```

   ```

import 'package:geocoding/geocoding.dart';

List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      print(placemarks[0].subLocality);
      city = placemarks[0].locality.toString();
      print(city);
      print(placemarks[0].country);
      print(placemarks[0].postalCode);
```
    
