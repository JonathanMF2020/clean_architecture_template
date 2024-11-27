import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_teca/features/movies/data/models/session/guest_session.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {}

class AuthDone extends AuthState {
  const AuthDone(this.movies);
  final GuestSessionModel movies;
}

class AuthError extends AuthState {
  const AuthError(this.error);
  final DioException error;
}
