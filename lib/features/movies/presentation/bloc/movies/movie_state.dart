import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_teca/features/movies/domain/entities/movie.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieLoading extends MovieState {}

class MovieDone extends MovieState {
  const MovieDone(this.movies);
  final List<MovieEntity> movies;
}

class MovieError extends MovieState {
  const MovieError(this.error);
  final DioException error;
}
