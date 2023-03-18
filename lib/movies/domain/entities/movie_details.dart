import 'package:equatable/equatable.dart';

abstract class MovieDetails extends Equatable {
  final String backdropPath;
  final String id;
  final String title;
  final String overview;
  final String runtime;
  final String voteAverage;
  final String voteCount;
  final String releaseDate;
  final List<Genre> genres;

  const MovieDetails({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.overview,
    required this.runtime,
    required this.voteAverage,
    required this.voteCount,
    required this.releaseDate,
    required this.genres,
  });

  @override
  List<Object> get props => [
        backdropPath,
        id,
        title,
        overview,
        runtime,
        voteAverage,
        voteCount,
        releaseDate,
        genres,
      ];
}

abstract class Genre extends Equatable {
  final String id;
  final String name;

  const Genre({required this.id, required this.name});

  @override
  List<Object> get props => [id, name];
}
