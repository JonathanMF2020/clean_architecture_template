import 'package:dio/dio.dart';
import 'package:movie_teca/features/movies/data/models/session/guest_session.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../../core/constants/constants.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class AuthApiService {
  factory AuthApiService(Dio dio) = _AuthApiService;

  @GET('authentication/guest_session/new')
  Future<HttpResponse<GuestSessionModel>> createSesion();
}
