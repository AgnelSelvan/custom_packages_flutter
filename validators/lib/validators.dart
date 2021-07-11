import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String validateStringData(dynamic data) =>
    data.toString() == "null" || data.toString() == null ? "" : data.toString();

int validateIntData(String data) {
  try {
    return data == "" || data == "null" || data == null ? 0 : int.parse(data);
  } catch (e) {
    debugPrint("Error in Int : $e");
    return 0;
  }
}

double validateDoubleData(String data) {
  try {
    return data == "" || data == "null" || data == null
        ? 0
        : double.parse(data);
  } catch (e) {
    debugPrint("Error in Double : $e");
    return 0;
  }
}

DateTime validateDateTime(String data) {
  try {
    return data == null || data == "null" || data == ""
        ? DateTime.now()
        : DateTime.tryParse(data)!;
  } catch (e) {
    //print(e.toString());
    return DateTime.now();
  }
}

// ignore: unnecessary_null_comparison
bool validateBoolData(bool data) => data == null ? false : data;

/**
 * Function returns Todays Date
 */
DateTime getTodaysDate() {
  return DateTime.now();
}

/**
 * Function returns Formatted DateTime based on the DateTime you provide
 */
// ignore: unnecessary_null_comparison
String getFormattedDateTime(DateTime dateTime) => dateTime == null
    ? ""
    : DateFormat(
            "${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}")
        .format(dateTime);

/** 
 * Function returns Formatted Date based on the Date you provide
*/
String getFormattedDate(DateTime dateTime, {String syntaxBetweenDates = "/"}) =>
    // ignore: unnecessary_null_comparison
    dateTime == null
        ? ""
        : DateFormat(
                "${dateTime.day.toString().padLeft(2, '0')}${syntaxBetweenDates}${dateTime.month.toString().padLeft(2, '0')}${syntaxBetweenDates}${dateTime.year}")
            .format(dateTime);

String getFormattedTime(TimeOfDay timeOfDay) {
  return "${timeOfDay.hour.toString().padLeft(2, '0')}:${timeOfDay.minute.toString().padLeft(2, '0')}";
}

/** 
 * Function returns Formatted Todays Date based on the Date you provide
*/
String getFormattedTodaysDate({String syntaxBetweenDates = "/"}) {
  DateTime dateTime = getTodaysDate();
  // ignore: unnecessary_null_comparison
  return dateTime == null
      ? ""
      : DateFormat(
              "${dateTime.day.toString().padLeft(2, '0')} ${syntaxBetweenDates} ${dateTime.month.toString().padLeft(2, '0')} ${syntaxBetweenDates} ${dateTime.year}")
          .format(dateTime);
}

Future<DateTime?> showDatePickerDialog(BuildContext context,
    {DateTime? initialDate, DateTime? firstDate}) async {
  DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? getTodaysDate(),
      lastDate: getTodaysDate().add(Duration(days: 365)));
  return dateTime;
}

Future<TimeOfDay?> showTimePickerDialog(BuildContext context,
    {TimeOfDay? initialTime}) async {
  TimeOfDay? dateTime = await showTimePicker(
    context: context,
    initialTime: initialTime ?? TimeOfDay.now(),
  );
  return dateTime;
}
