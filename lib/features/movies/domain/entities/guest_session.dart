import 'package:equatable/equatable.dart';

class GuestSessionEntity extends Equatable {
  const GuestSessionEntity(
      {this.success, this.guest_session_id, this.expires_at});
  final bool? success;
  final String? guest_session_id;
  final String? expires_at;

  @override
  List<Object?> get props {
    return [success, guest_session_id, expires_at];
  }
}
