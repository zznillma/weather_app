import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/features/wether/data/models/weather_model.dart';
import 'package:weather_app/features/wether/domain/repositories/weather_repository.dart';
import 'package:weather_app/internal/helpers/api_requester.dart';

import '../../../../internal/helpers/catch_exception_helper.dart';

@Injectable(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  @override
  Future<WeatherModel> getWeather(String city) async {
    ApiRequester apiRequester = ApiRequester();

    try {
      Response response = await apiRequester.toGet('weather', param: {
        'q': city,
        'lang': 'ru',
        'appid': 'd0617a5c2dca461ecff826af2453a679'
      });

      log('result data == ${response.data}');
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      }
      throw CatchException.convertException(response);
    } catch (e) {
      print('e111 ==== $e');
      throw CatchException.convertException(e);
    }
  }
}
