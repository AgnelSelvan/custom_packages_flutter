import 'package:intl/intl.dart';

String validateStringData(dynamic data) =>
    data.toString() == "null" || data.toString() == null ? "" : data.toString();

int validateIntData(String data) =>
    data == "" || data == "null" || data == null ? 0 : int.parse(data);

double validateDoubleData(String data) =>
    data == "" || data == "null" || data == null ? 0 : double.parse(data);

DateTime validateDateTime(String data) {
  try {
    return data == null || data == "null" || data == ""
        ? DateTime.now()
        : DateTime.tryParse(data);
  } catch (e) {
    //print(e.toString());
    return DateTime.now();
  }
}

validateBoolData(bool data) => data == null ? false : true;

String getFormattedDateTime(DateTime dateTime) => dateTime == null
    ? ""
    : DateFormat(
            "${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}")
        .format(dateTime);
