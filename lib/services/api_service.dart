import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final Dio _dio;
  static const _baseUrl = 'http://10.0.2.2:8000/api/v1/';

  //Dio Configure baseUrl, headers, receiveTimeout, connectTimeout
  ApiService()
    : _dio = Dio(
        BaseOptions(
          baseUrl: _baseUrl,
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 3),
          headers: {'Content-Type': 'application/json'},
        ),
      ) {
    //before sent Req
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          //if request tocken needed
          if (options.extra['requiresAuth '] == true) {
            final token = await _getToken(); //find from local storage
            if (token != null) {
              options.headers['Authorization'] = 'Bearer $token';
            }
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) {
          debugPrint('Dio Error: ${e.message}');
          return handler.next(e);
        },
      ),
    );
  }

  //GEt Token from local Storage
  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  //get Req
  Future<dynamic> get(String endpoint, {bool requiresAuth = false}) async {
    try {
      final response = await _dio.get(
        endpoint,
        options: Options(extra: {'requiresAuth': requiresAuth}),
      );
      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  //Post Req
  Future<dynamic> post(
    String endpoint,
    dynamic data, {
    bool requiresAuth = false,
  }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
        options: Options(extra: {'requiresAuth': requiresAuth}),
      );
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  //Put
  Future<dynamic> put(
    String endpoint,
    Map<String, dynamic> data, {
    bool requiresAuth = true,
  }) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: data,
        options: Options(extra: {'requiresAuth': requiresAuth}),
      );
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  //Delete
  Future<void> delete(String endpoint, {bool requiresAuth = true}) async {
    try{
      await _dio.delete(
        endpoint,
        options: Options(extra: {'requiresAuth': requiresAuth}),
      );
    } on DioException catch (e){
      _handleError(e);
    }
  }

  // Error Handler Methode
  void _handleError(DioException e) {
    String errorMessage;
    if (e.response != null) {
      errorMessage =
          'Error: ${e.response?.statusCode}. ${e.response?.data['detail'] ?? e.response?.data.toString()}';
    } else {
      errorMessage = 'Network error: ${e.message}';
    }
  }
}
