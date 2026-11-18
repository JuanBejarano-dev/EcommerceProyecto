import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../utils/api_client.dart';
import '../utils/storage_service.dart';

class SplashProvider with ChangeNotifier {
  Future<bool> validateSession() async {
    // Pequeña espera para que se vea el splash
    await Future.delayed(const Duration(seconds: 2));

    final token = await StorageService.getToken();
    if (token == null || token.isEmpty) {
      return false;
    }

    try {
      final response = await ApiClient.dio.get('/auth/me');
      return response.statusCode == 200;
    } on DioException catch (e) {
      // 401 = token inválido o expirado → lo borramos
      if (e.response?.statusCode == 401) {
        await StorageService.deleteToken();
      }

      return false;
    }
  }
}
