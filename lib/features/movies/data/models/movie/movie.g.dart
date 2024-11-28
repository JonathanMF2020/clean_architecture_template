// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      id: (json['id'] as num?)?.toInt(),
      originalTitle: json['originalTitle'] as String?,
      overview: json['overview'] as String?,
      title: json['title'] as String?,
      poster_path: json['poster_path'] as String?,
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'originalTitle': instance.originalTitle,
      'overview': instance.overview,
      'title': instance.title,
      'poster_path': instance.poster_path,
    };
