import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_teca/features/movies/data/models/dto/movie_dto/movie_dto.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/repository/movie_repository.dart';
import '../data_sources/remote/movies/movies_api_service.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._moviesApiService);
  final MoviesApiService _moviesApiService;
  @override
  Future<DataState<MovieDto>> getMovies() async {
    try {
      final httpResponse = await _moviesApiService.getMoviesTop();
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
