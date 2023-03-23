import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/features/wether/presentation/logic/bloc/weather_bloc.dart';
import 'package:weather_app/internal/dependencies/get_it.dart';
import 'package:weather_app/internal/helpers/utils.dart';

class WeatherDetail extends StatefulWidget {
  final String city;

  const WeatherDetail({
    super.key,
    required this.city,
  });

  @override
  State<WeatherDetail> createState() => _WeatherDetailState();
}

class _WeatherDetailState extends State<WeatherDetail> {
  late WeatherBloc bloc;
  late String city;

  @override
  void initState() {
    bloc = getIt<WeatherBloc>();
    bloc.add(GetWeatherEvent(city: widget.city.toString()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.blue[200],
      body: BlocConsumer<WeatherBloc, WeatherState>(
        bloc: bloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is WeatherLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is WeatherLoadedState) {
            double temp = state.weatherModel.main!.temp!.toDouble() - 273.15;

            return Center(
              child: Column(
                children: [
                  Text(
                    convertDate(state.weatherModel.dt ?? 2),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.sp,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    '${convertTime(state.weatherModel.dt ?? 2)}am',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.sp,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    state.weatherModel.name ?? '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.sp,
                    ),
                  ),
                  CachedNetworkImage(
                    imageUrl:
                        'https://openweathermap.org/img/wn/${state.weatherModel.weather!.first.icon}@4x.png',
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                      height: 40,
                      width: 40,
                    ),
                    // errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  Text(
                    '${temp.ceil()}°',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 70.sp,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    convertWeekDay(state.weatherModel.dt ?? 0),
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
            );
          }

          return Text('123');
        },
      ),
    );
  }
}
