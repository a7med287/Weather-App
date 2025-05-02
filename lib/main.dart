import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_ap/models/weather_model.dart';
import 'package:weather_ap/pages/home_page.dart';
import 'package:weather_ap/providers/weather_provider.dart';

void main(){

  runApp( Weather());

}

class Weather extends StatelessWidget{
   Weather({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return  WeatherProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
