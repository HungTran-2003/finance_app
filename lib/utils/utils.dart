import 'package:intl/intl.dart';

class Utils {
  String formatCurrencyEN(double value) {
    final formatter = NumberFormat('#,##0.00', 'en_US');
    return formatter.format(value);
  }
}