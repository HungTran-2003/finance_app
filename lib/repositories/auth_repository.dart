import 'dart:developer';

import 'package:finance_app/networking/api_client.dart';

abstract class AuthRepository{
  Future<void> signUp({
    required String email,
    required String password,
  });

  Future<bool> signIn({
    required String email,
    required String password,
  });

}

class AuthRepositoryImpl extends AuthRepository {
  final ApiClient _apiClient;

  AuthRepositoryImpl(this._apiClient);

  @override
  Future<void> signUp({required String email, required String password}) async {
    try {
      final response = await _apiClient.signUp(
        email: email,
        password: password,
      );
    } catch (e) {
      log('Error during sign up: $e');
      rethrow;
    }
  }

  @override
  Future<bool> signIn({required String email, required String password}) async{
    try {
      final response = await _apiClient.signIn(email: email, password: password);
      if(response.user == null){
        return false;
      }
      return true;
    } catch (e) {
      log('Error during sign in: $e');
      rethrow;

    }
  }

}