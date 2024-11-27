import 'package:movie_teca/features/movies/data/models/dto/movie_dto/movie_dto.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../repository/movie_repository.dart';

class GetMoviesUseCase implements UseCase<DataState<MovieDto>, void> {
  GetMoviesUseCase(this._movieRepository);
  final MovieRepository _movieRepository;
  @override
  Future<DataState<MovieDto>> call({void params}) {
    return _movieRepository.getMovies();
  }
}
