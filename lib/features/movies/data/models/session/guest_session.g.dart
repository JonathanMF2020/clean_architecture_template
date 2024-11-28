// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'guest_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuestSessionModel _$GuestSessionModelFromJson(Map<String, dynamic> json) =>
    GuestSessionModel(
      success: json['success'] as bool?,
      guest_session_id: json['guest_session_id'] as String?,
      expires_at: json['expires_at'] as String?,
    );

Map<String, dynamic> _$GuestSessionModelToJson(GuestSessionModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'guest_session_id': instance.guest_session_id,
      'expires_at': instance.expires_at,
    };
