import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_ap/models/weather_model.dart';
import 'package:weather_ap/providers/weather_provider.dart';

class WeatherReslutWidget extends StatelessWidget {
  WeatherReslutWidget({super.key});

  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherModel;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            weatherData!.getColor(),
            weatherData!.getColor()[50]!,
          ],
        ),
      ),
      child: Column(
        children: [
          const Spacer(
            flex: 3,
          ),
          Text(
            weatherData!.cityName,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Text(
            "Updated: ${weatherData!.date.split(" ")[1]}",
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: CachedNetworkImage(
                  imageUrl: weatherData!.iamgePath,
                  placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                  )),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.fill,
                ),
              ),
              //Image.network(weatherData!.iamgePath),
              Text(
                "${weatherData!.avgTemp.toInt()}",
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Text(
                    "min: ${weatherData!.minTemp.toInt()}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "max: ${weatherData!.maxTemp.toInt()}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Text(
            weatherData!.weatherStatus,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const Spacer(
            flex: 6,
          ),
        ],
      ),
    );
  }
}
