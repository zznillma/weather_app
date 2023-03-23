// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';
import 'package:weather_app/features/wether/data/models/weather_model.dart';
import 'package:weather_app/features/wether/domain/repositories/weather_repository.dart';

@injectable
class WeatherUseCase {
  final WeatherRepository weatherRepository;

  WeatherUseCase({required this.weatherRepository});

  Future<WeatherModel> getWeather(String city) async =>
      await weatherRepository.getWeather(city);
}
