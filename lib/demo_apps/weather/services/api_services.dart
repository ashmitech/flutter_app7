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