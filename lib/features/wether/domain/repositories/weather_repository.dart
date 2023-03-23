import 'package:weather_app/features/wether/data/models/weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherModel> getWeather(String city);
}