import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/features/wether/presentation/logic/bloc/weather_bloc.dart';
import 'package:weather_app/features/wether/presentation/screens/weather_detail_screen/weather_detail_screen.dart';
import 'package:weather_app/internal/dependencies/get_it.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController controller;
  late bool isActive;
  late WeatherBloc bloc;
  bool isLoading = false;

  @override
  void initState() {
    controller = TextEditingController();
    isActive = false;

    bloc = getIt<WeatherBloc>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 200.w,
              child: TextField(
                onChanged: (value) {
                  if (controller.text.isNotEmpty) {
                    isActive = true;
                  } else {
                    isActive = false;
                  }

                  setState(() {});
                },
                style: const TextStyle(color: Colors.black),
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Введите город...',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10).r,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10).r,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 40.h),
          BlocConsumer<WeatherBloc, WeatherState>(
              bloc: bloc,
              listener: (context, state) {
                if (state is WeatherLoadingState) {
                  isLoading = true;
                }

                if (state is WeatherErrorState) {
                  isLoading = false;

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.error.message.toString()),
                    ),
                  );
                }

                if (state is WeatherLoadedState) {
                  isLoading = false;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          WeatherDetailScreen(weatherModel: state.weatherModel),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: isActive
                                ? Colors.blue
                                : Colors.blue.withOpacity(0.5)),
                        onPressed: () {
                          bloc.add(GetWeatherEvent(city: controller.text));
                        },
                        child: const Text('Далее'),
                      );
              })
        ],
      ),
    );
  }
}