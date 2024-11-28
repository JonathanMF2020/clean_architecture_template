import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_teca/core/dio/dio_interceptor.dart';
import 'package:movie_teca/features/movies/data/data_sources/remote/auth/auth_api_service.dart';
import 'package:movie_teca/features/movies/data/repository/auth_repository_impl.dart';
import 'package:movie_teca/features/movies/domain/repository/auth_repository.dart';
import 'package:movie_teca/features/movies/domain/usecases/auth/create_session.dart';
import 'package:movie_teca/features/movies/presentation/bloc/auth/auth_bloc.dart';

import 'features/movies/data/data_sources/local/secure_storage.dart';
import 'features/movies/data/data_sources/remote/movies/movies_api_service.dart';
import 'features/movies/data/repository/movie_repository_impl.dart';
import 'features/movies/domain/repository/movie_repository.dart';
import 'features/movies/domain/usecases/movie/get_movies.dart';
import 'features/movies/presentation/bloc/movies/movie_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  final dio = Dio();
  dio.interceptors.add(DioInterceptor());
  sl.registerSingleton<Dio>(dio);

  // Data sources
  // Remote
  sl.registerSingleton<MoviesApiService>(MoviesApiService(sl()));
  sl.registerSingleton<AuthApiService>(AuthApiService(sl()));
  // Local
  sl.registerLazySingleton<SecureStorage>(SecureStorage.new);

  // Repository

  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // Use cases

  sl.registerLazySingleton(() => GetMoviesUseCase(sl()));
  sl.registerLazySingleton(() => CreateSessionUseCase(sl(), sl()));

  // Blocs
  sl.registerFactory(() => MovieBloc(sl()));
  sl.registerFactory(() => AuthBloc(sl()));
}
