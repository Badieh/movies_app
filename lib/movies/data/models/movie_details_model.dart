import 'package:movies_app/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.backdropPath,
      required super.id,
      required super.title,
      required super.overview,
      required super.runtime,
      required super.voteAverage,
      required super.voteCount,
      required super.releaseDate,
      required super.genres});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
        backdropPath: json['backdrop_path'],
        id: json['id'],
        title: json['title'],
        overview: json['overview'],
        runtime: json['runtime'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count'],
        releaseDate: json['release_date'],
        genres: List<GenresModel>.from(
            json['genre'].map((e) => GenresModel.fromJson(e))));
  }
}

class GenresModel extends Genre {
  const GenresModel({required super.id, required super.name});

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(id: json['id'], name: json['name']);
  }
}
