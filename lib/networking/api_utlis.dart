import 'package:finance_app/networking/api_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ApiUtil {
  static ApiClient get apiClient => ApiClient(Supabase.instance.client);
}