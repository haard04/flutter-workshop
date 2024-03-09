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