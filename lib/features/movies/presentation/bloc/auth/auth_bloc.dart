import 'package:flutter/foundation.dart';
import 'package:movie_teca/features/movies/domain/usecases/auth/create_session.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/resources/data_state.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.createSessionUseCase) : super(AuthLoading()) {
    on<CreateSession>(onCreateSession);
  }
  final CreateSessionUseCase createSessionUseCase;

  Future<void> onCreateSession(
      CreateSession event, Emitter<AuthState> emit) async {
    final dataState =
        await createSessionUseCase(); // _getArticleUseCase.call() is equal to _getArticleUseCase() in Dart (Object.call() == Object())
    if (dataState is DataSuccess) {
      emit(AuthDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      if (kDebugMode) {
        print("[Error] ${dataState.error.toString()}");
      }
      emit(AuthError(dataState.error!));
    }
  }
}
