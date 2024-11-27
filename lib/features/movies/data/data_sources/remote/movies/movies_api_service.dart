import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../models/dto/movie_dto/movie_dto.dart';

part 'movies_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class MoviesApiService {
  factory MoviesApiService(Dio dio) = _MoviesApiService;

  @GET('movie/top_rated')
  Future<HttpResponse<MovieDto>> getMoviesTop();
}
