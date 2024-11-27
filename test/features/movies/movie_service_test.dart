import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_teca/core/constants/constants.dart';

void main() {
  late Dio dio;
  setUp(() {
    dio = Dio();
  });

  test('[Unitaria]: Prueba de servicio "Top Rated"', () async {
    print(
        "Realizando la llamada al servicio de https://api.themoviedb.org/3/movie/top_rated");
    final response = await dio.get(
        "https://api.themoviedb.org/3/movie/top_rated",
        options: Options(headers: {
          'Authorization': 'Bearer $newsAPIKey',
          'Content-Type': 'application/json'
        }));
    expect(response.statusCode, HttpStatus.ok);
    expect(response.data, isNotNull);
    expect(response.data["results"], isNotEmpty);
  });
}
