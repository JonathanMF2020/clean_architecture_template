import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_teca/features/movies/domain/usecases/movie/get_movies.dart';

import '../../../../../core/resources/data_state.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc(this.getMovies) : super(MovieLoading()) {
    on<GetMovies>(onGetMovies);
  }
  final GetMoviesUseCase getMovies;

  Future<void> onGetMovies(GetMovies event, Emitter<MovieState> emit) async {
    final dataState =
        await getMovies(); // _getArticleUseCase.call() is equal to _getArticleUseCase() in Dart (Object.call() == Object())
    if (dataState is DataSuccess) {
      emit(MovieDone(dataState.data!.results));
    }

    if (dataState is DataFailed) {
      if (kDebugMode) {
        print("[Error] ${dataState.error.toString()}");
      }
      emit(MovieError(dataState.error!));
    }
  }
}
