import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_ap/models/weather_model.dart';

class WeatherServices {

  String baseurl = "http://api.weatherapi.com/v1";
  String apiKey = "ce5614098bd74170b3f192706251403";

  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weatherModel;

    try{

      Uri url =
      Uri.parse("$baseurl/forecast.json?key=$apiKey&q=$cityName&days=1");
      http.Response response = await http.get(url);

      Map<String, dynamic> jsonData = jsonDecode(response.body);


      weatherModel  = WeatherModel.fromJson(jsonData);


    }catch(e){
      print(e);
    }



    return weatherModel;

  }
}
