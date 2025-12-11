import 'package:finance_app/models/enum/language.dart';

class AppConfigs {
  AppConfigs._();

  static const dateDisplayFormat = 'MMMM d, yyyy';
  static const dateTimeDisplayFormat = 'dd/MM/yyyy hh:mm a';
  static const timeDisplayFormat = 'hh:mm a';
  static const datePickerFormat = 'dd/MM/yyyy';

  ///Supabase
  static const supabaseUrl = 'https://iidpgetlhglevrfcywiy.supabase.co';
  static final avatarBaseUrl = "$supabaseUrl/storage/v1/object/public/";

  static const defaultLanguage = Language.english;

  static const appName = 'Finance App';
}
