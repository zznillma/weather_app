import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/features/wether/data/repositoriies/weather_repository_impl.dart';

import 'package:weather_app/features/wether/presentation/screens/search_screen/search_screen.dart';
import 'package:weather_app/internal/dependencies/get_it.dart';
import 'package:weather_app/internal/helpers/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: SearchScreen(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int timestemp = 1679101673;
  late var date;
  late var d24;
  //  WeatherUseCase useCase = WeatherUseCase(weatherRepository: );

  WeatherRepositoryImpl qwe = WeatherRepositoryImpl();
  @override
  void initState() {
    qwe.getWeather('London');

    // print('timestemp === $timestemp');
    // date = DateTime.fromMicrosecondsSinceEpoch(timestemp * 1000);
    // d24 = DateFormat('HH:mm').format(date);
    // print('date == $date');
    // print('d24 == $d24');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(convertDate(timestemp)),
      ),
    );
  }
}
