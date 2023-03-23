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
