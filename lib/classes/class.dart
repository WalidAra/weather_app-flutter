import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../service/api.dart';

DateTime currentDate = DateTime.now();
String formattedDate = DateFormat('EEEE, HH:mm').format(currentDate);

class WeatherData {
  String description;
  double temp;
  Icon icon;
  String country;
  double windDeg;
  double humidity;
  double pressure;

  WeatherData({
    required this.description,
    required this.temp,
    required this.icon,
    required this.windDeg,
    required this.country,
    required this.humidity,
    required this.pressure,
  });
}

WeatherData weatherDataFromJson(Map<String, dynamic> json) {
  return WeatherData(
    description: json['weather'][0]['description'],
    temp: json['main']['temp'].toDouble(),
    icon: Icon(
      Icons.cloud,
    ), // Replace with the appropriate icon based on the JSON data
    windDeg: json['wind']['speed'].toDouble(),
    country: json['sys']['country'],
    humidity: json['main']['humidity'].toDouble(),
    pressure: json['main']['pressure'].toDouble(),
  );
}

class PageColors {
  Color cone;
  Color ctwo;

  PageColors({this.cone = const Color(0xffe5ecf4), this.ctwo = const Color(0xff313745)});

  void reverse(){
    Color temp = cone ;
    cone = ctwo ;
    ctwo = temp ;
  }
}
