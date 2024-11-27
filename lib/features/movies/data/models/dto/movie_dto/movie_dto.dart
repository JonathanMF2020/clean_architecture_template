import 'package:json_annotation/json_annotation.dart';

import '../../movie/movie.dart';

part 'movie_dto.g.dart';

@JsonSerializable()
class MovieDto {
  factory MovieDto.fromJson(Map<String, dynamic> json) =>
      _$MovieDtoFromJson(json);

  MovieDto({required this.results});
  final List<MovieModel> results;
}
