import 'package:movies_app/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel(
      {required super.id,
      required super.backdropPath,
      required super.title,
      required super.overview,
      required super.genreIds,
      required super.voteAverage,
      required super.releaseDate});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        id: json["id"],
        title: json["title"],
        backdropPath: json["backdrop_path"],
        genreIds: List.from(json['genreIds'].map((e) => e)),
        overview: json["overview"],
        voteAverage: json["voteAverage"],
        releaseDate: json["releaseDate"]);
  }
}
