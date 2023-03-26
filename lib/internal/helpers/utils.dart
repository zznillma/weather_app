import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

convertDate(int timestemp) {
  String dateConverter = DateFormat('EEEE, d MMMM')
      .format(DateTime.fromMillisecondsSinceEpoch(timestemp * 1000));
  // print('formateDate === $dateConverter');

  return dateConverter;
}

convertTime(int timestemp) {
  String dateConverter = DateFormat('h:mm')
      .format(DateTime.fromMillisecondsSinceEpoch(timestemp * 1000));
  // print('formateDate === $dateConverter');

  return dateConverter;
}

convertWeekDay(int timestemp) {
  String dateConverter = DateFormat('EEEE')
      .format(DateTime.fromMillisecondsSinceEpoch(timestemp * 1000));
  // print('formateDate === $dateConverter');

  return dateConverter;
}

backgroundHelper(String weather) {
  switch (weather) {
    case "Clouds":
      return Colors.blue[100];

    case "Rain":
      return Colors.grey[400];

    case "Clear":
      return Colors.blue;

    default:
      return Colors.black;
  }
}

weatherImage(String image) {
  switch (image) {
    case '01d':
      return 'assets/images/sun.png';

    case '02d':
      return 'assets/images/sunclouds.png';

    case '03d':
    case '03n':
      return 'assets/images/clouds.png';

    case '04d':
    case '04n':
      return 'assets/images/brokenclouds.png';

    case '09d':
    case '09n':
      return 'assets/images/rain.png';

    case '10d':
      return 'assets/images/rainwithsun.png';

    case '10n':
      return 'assets/images/rainwithmoon.png';

    case '11d':
    case '11n':
      return 'assets/images/thunder.png';

    case '13d':
    case '13n':
      return 'assets/images/snow.png';

    case '50d':
    case '50n':
      return 'assets/images/mist.png';

    case '01n':
      return 'assets/images/moon.png';

    case '02n':
      return 'assets/images/moonclouds.png';
    default:
      return '';
  }
}
