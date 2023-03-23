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
