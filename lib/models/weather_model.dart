import 'package:flutter/material.dart';

class WeatherModel {
  final String date, weatherStatus, cityName, iamgePath;
  final double avgTemp, maxTemp, minTemp;

  WeatherModel(
      {required this.cityName,
      required this.iamgePath,
      required this.date,
      required this.weatherStatus,
      required this.avgTemp,
      required this.maxTemp,
      required this.minTemp});

  factory WeatherModel.fromJson(dynamic data) {
    var baseData = data["forecast"]["forecastday"][0]["day"];

    return WeatherModel(
        date: data["location"]["localtime"],
        weatherStatus: baseData["condition"]["text"],
        avgTemp: baseData["avgtemp_c"],
        maxTemp: baseData["maxtemp_c"],
        minTemp: baseData["mintemp_c"],
        cityName: data["location"]["name"],
        iamgePath: "https:${baseData["condition"]["icon"]}");
  }

  @override
  String toString() {
    return "City=$cityName\nDate=$date\nAverage Temp= $avgTemp\nMax Temp=$maxTemp\nMin Temp=$minTemp";
  }

  MaterialColor getColor(){

    if (weatherStatus == "Clear" || weatherStatus == "Light Cloud"||weatherStatus == "Sunny") {
      return Colors.orange;
    } else if (weatherStatus == "Heavy Cloud") {
      return Colors.blueGrey;
    } else if (weatherStatus == "Showers" || weatherStatus == "Light Rain"||weatherStatus == "Snow") {
      return Colors.lightBlue;
    } else if (weatherStatus == "Heavy Rain" || weatherStatus == "Thunderstorm"||weatherStatus == "Partly Cloudy") {
      return Colors.indigo;
    }else if (weatherStatus == "Partly Cloudy") {
      return Colors.amber;
    } else if (weatherStatus == "Sleet") {
      return Colors.grey;
    } else if (weatherStatus == "Hail") {
      return Colors.cyan;
    } else {
      // Default color for unhandled cases
      return Colors.blue;
    }


  }
}
