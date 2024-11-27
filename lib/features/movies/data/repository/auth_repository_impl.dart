import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_sources/remote/auth/auth_api_service.dart';
import '../models/session/guest_session.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._moviesApiService);
  final AuthApiService _moviesApiService;

  @override
  Future<DataState<GuestSessionModel>> createSession() async {
    try {
      final httpResponse = await _moviesApiService.createSesion();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            error: httpResponse.response.statusMessage,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrintStack(stackTrace: e.stackTrace);
      }
      return DataFailed(e);
    }
  }
}
