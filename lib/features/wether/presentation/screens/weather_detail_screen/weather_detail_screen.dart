import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/features/wether/data/models/weather_model.dart';
import 'package:weather_app/internal/helpers/utils.dart';

class WeatherDetailScreen extends StatelessWidget {
  final WeatherModel weatherModel;

  const WeatherDetailScreen({
    super.key,
    required this.weatherModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: backgroundHelper(weatherModel.weather!.first.main ?? ''),
      body: Center(
        child: Column(
          children: [
            Text(
              convertDate(weatherModel.dt ?? 2),
              style: TextStyle(
                color: Colors.white,
                fontSize: 17.sp,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              '${convertTime(weatherModel.dt ?? 2)}am',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.sp,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              weatherModel.name ?? '',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17.sp,
              ),
            ),
            SizedBox(
              height: 300,
              width: 300,
              child: Image.asset(
                weatherImage(weatherModel.weather!.first.icon.toString()),
                fit: BoxFit.cover,
              ),
            ),
            Text(
              '${weatherModel.main!.temp!.toDouble().ceil() - 273.15.ceil()}°',
              style: TextStyle(
                color: Colors.white,
                fontSize: 70.sp,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              convertWeekDay(weatherModel.dt ?? 0),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              height: 3.h,
              width: 0.7.sw,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2).r,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
