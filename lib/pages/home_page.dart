import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_ap/models/weather_model.dart';
import 'package:weather_ap/pages/saerch_page.dart';
import 'package:weather_ap/providers/weather_provider.dart';
import 'package:weather_ap/widgets/Weather_reslut_widget.dart';
import 'package:weather_ap/widgets/no_weather_widget.dart';

import '../widgets/search_icon_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi() {
    setState(() {});
  }

  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData =Provider.of<WeatherProvider>(context).weatherModel;
    return Scaffold(
      appBar: AppBar(
        elevation: 50,
        actions: [
          IconSearchWidget(
            updateUi: updateUi,
          ),
        ],
        backgroundColor: Provider.of<WeatherProvider>(context).weatherModel?.getColor() ?? Colors.blue,
        title: const Text(
          "Weather",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body:  weatherData == null
          ? const NoWeatherWidget()
          :  WeatherReslutWidget(),
    );
  }
}
