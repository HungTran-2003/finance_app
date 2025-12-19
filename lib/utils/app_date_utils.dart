import 'package:finance_app/configs/app_configs.dart';
import 'package:intl/intl.dart';

class AppDateUtils{
  AppDateUtils._();

  static String toDateString(DateTime dateTime) {
    return DateFormat(AppConfigs.dateDisplayFormat).format(dateTime);
  }
}