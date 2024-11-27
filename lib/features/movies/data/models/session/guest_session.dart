import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/guest_session.dart';

part 'guest_session.g.dart';

@JsonSerializable()
class GuestSessionModel extends GuestSessionEntity {
  const GuestSessionModel({
    bool? success,
    String? guest_session_id,
    String? expires_at,
  }) : super(
          success: success,
          guest_session_id: guest_session_id,
          expires_at: expires_at,
        );

  factory GuestSessionModel.fromJson(Map<String, dynamic> json) =>
      _$GuestSessionModelFromJson(json);
}
