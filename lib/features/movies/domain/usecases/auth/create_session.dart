import 'package:movie_teca/features/movies/data/data_sources/local/secure_storage.dart';
import 'package:movie_teca/features/movies/data/models/session/guest_session.dart';
import 'package:movie_teca/features/movies/domain/repository/auth_repository.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../../../core/usecase/usecase.dart';

class CreateSessionUseCase
    implements UseCase<DataState<GuestSessionModel>, void> {
  CreateSessionUseCase(this._authRepository, this.secureStorage);
  final AuthRepository _authRepository;
  final SecureStorage secureStorage;
  @override
  Future<DataState<GuestSessionModel>> call({void params}) async {
    final guestdata = await _authRepository.createSession();
    secureStorage.writeData("SESSION", guestdata.data!.guest_session_id!);
    return guestdata;
  }
}
