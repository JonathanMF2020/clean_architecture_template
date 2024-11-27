import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  const MovieEntity(
      {this.id,
      this.originalTitle,
      this.overview,
      this.title,
      this.poster_path});
  final int? id;
  final String? originalTitle;
  final String? overview;
  final String? title;
  final String? poster_path;

  @override
  List<Object?> get props {
    return [id, originalTitle, overview, title, poster_path];
  }
}
