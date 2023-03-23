import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/features/wether/presentation/screens/weather_detail_screen/weather_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController controller;
  late bool isActive;

  @override
  void initState() {
    controller = TextEditingController();
    isActive = false;
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
                style: TextStyle(color: Colors.black),
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
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor:
                    isActive ? Colors.blue : Colors.blue.withOpacity(0.5)),
            onPressed: () {
              if (isActive) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WeatherDetail(
                        city: controller.text,
                      ),
                    ));
              }
            },
            child: Text('Далее'),
          )
        ],
      ),
    );
  }
}
