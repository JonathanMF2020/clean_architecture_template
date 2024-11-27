import '../../../../core/resources/data_state.dart';
import '../../data/models/session/guest_session.dart';

abstract class AuthRepository {
  // API Methods
  Future<DataState<GuestSessionModel>> createSession();
}
