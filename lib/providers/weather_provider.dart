import 'package:flutter/material.dart';
import 'package:weather_ap/models/weather_model.dart';
import 'package:weather_ap/services/weather_services.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherModel;
  bool _isLoading = false;

  WeatherModel? get weatherModel => _weatherModel;
  bool get isLoading => _isLoading;

  set weatherModel(WeatherModel? weather) {
    _weatherModel = weather;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> fetchWeather(String cityName) async {
    try {
      setLoading(true);
      WeatherServices service = WeatherServices();
      WeatherModel? weather = await service.getWeather(cityName: cityName);
      _weatherModel = weather;
    } catch (e) {
      print('Error fetching weather: $e');
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }
}
