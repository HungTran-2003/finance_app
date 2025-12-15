import 'package:supabase_flutter/supabase_flutter.dart';

class ApiClient {
  final SupabaseClient _supabaseClient;

  ApiClient(this._supabaseClient);

  Future<AuthResponse> signUp({
    required String email,
    required String password,
  }) async {
    return await _supabaseClient.auth.signUp(
      email: email,
      password: password,
    );
  }
}