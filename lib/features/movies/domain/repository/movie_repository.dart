import 'package:movie_teca/features/movies/data/models/dto/movie_dto/movie_dto.dart';

import '../../../../core/resources/data_state.dart';

abstract class MovieRepository {
  // API Methods
  Future<DataState<MovieDto>> getMovies();
}
