import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/movie.dart';

part 'movie.g.dart';

@JsonSerializable()
class MovieModel extends MovieEntity {
  const MovieModel({
    int? id,
    String? originalTitle,
    String? overview,
    String? title,
    String? poster_path,
  }) : super(
          id: id,
          originalTitle: originalTitle,
          overview: overview,
          title: title,
          poster_path: poster_path,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
}
