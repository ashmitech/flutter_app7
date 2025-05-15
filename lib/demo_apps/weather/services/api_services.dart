import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:my_app/demo_apps/weather/model/weather_model.dart';

Future<Weather> fetchDummyWeather() async{
  final String response = await rootBundle.loadString('assets/weather.json');
  final data= jsonDecode(response);
  return Weather.fromJson(data);
}

Future<Map<String, dynamic>> fetchWeatherFromServer() async{
  final response = await Dio().get('http://localhost:3000/weather');
  return response.data;
}

Future<List<String>> fetchCityNames() async {
  final response = await Dio().get('http://localhost:3000/weather'); // Use real endpoint

  if (response.statusCode == 200) {
    final data = response.data as List;

    // Assuming each item is like { "location": "Kathmandu", "temperature": ..., "condition": ... }
    return data.map<String>((item) => item['location'].toString()).toList();
  } else {
    throw Exception('Failed to fetch cities');
  }
}
