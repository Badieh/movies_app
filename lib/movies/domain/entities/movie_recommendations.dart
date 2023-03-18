import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';

abstract class MovieRecommendations extends Equatable {
  final List<Movie> movieRecommendations;

  const MovieRecommendations({required this.movieRecommendations});

  @override
  List<Object> get props => [movieRecommendations];
}
