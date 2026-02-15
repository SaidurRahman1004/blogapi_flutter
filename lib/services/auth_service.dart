import 'package:blogapi_flutter/models/user.dart';
import 'package:blogapi_flutter/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final ApiService _apiService;

  AuthService(this._apiService);

  //rigester
  Future<Map<String, dynamic>> register({
    required String username,
    required String email,
    required String password,
    required String password2,
    String? firstName,
    String? lastName,
  }) async {
    final data = {
      'username': username,
      'email': email,
      'password': password,
      'password2': password2,
      'first_name': firstName ?? '',
      'last_name': lastName ?? '',
    };
    final response = await _apiService.post('/auth/register/', data);
    await _saveTokens(response['tokens']);
    return response;
  }

  //login
  Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  }) async {
    final data = {'username': username, 'password': password};
    final response = await _apiService.post('/auth/login/', data);
    await _saveTokens(response['tokens']);
    return response;
  }

  //logout
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.getString('refresh_token');
    if (refreshToken != null) {
      try {
        await _apiService.post('/auth/logout/', {
          'refresh': refreshToken,
        }, requiresAuth: true);
      } catch (e) {
        debugPrint('Logout error: $e');
      }
      await _clearTokens();
    }
  }

  //current User
  Future<User> currentUser() async {
    final user = await _apiService.get('/auth/users/me/', requiresAuth: true);
    return User.fromJson(user);
  }
  //cheak Login
  Future<bool> isLoggedIn() async{
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('access_token');
    return accessToken != null;
  }

  //Token Saved
  Future<void> _saveTokens(Map<String, dynamic> tokens) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', tokens['access']);
    await prefs.setString('refresh_token', tokens['refresh']);
  }

  //clear token
  Future<void> _clearTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    await prefs.remove('refresh_token');
  }
}
