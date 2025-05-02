import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:weather_ap/providers/weather_provider.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  String? cityName;

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: const Text(
          "Search a City",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: weatherProvider.isLoading,
        progressIndicator: const CircularProgressIndicator(
          color: Colors.blue, //تغير اللون
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: TextField(
              onChanged: (data) {
                cityName = data;
              },
              onSubmitted: (data) async {
                cityName = data;
                if (cityName != null && cityName!.isNotEmpty) {
                  await weatherProvider.fetchWeather(cityName!);
                  Navigator.pop(context);
                }
              },
              decoration: InputDecoration(
                suffix: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    onTap: () async {
                      if (cityName != null && cityName!.isNotEmpty) {
                        await weatherProvider.fetchWeather(cityName!);
                        Navigator.pop(context);
                      }
                    },
                    child: const Icon(Icons.search),
                  ),
                ),
                hintText: "Enter a city name",
                contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                label: const Text(
                  "Search",
                  style: TextStyle(color: Colors.blue),
                ),
                hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
                border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(width: 2, color: Colors.blue),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(width: 2, color: Colors.blue),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
