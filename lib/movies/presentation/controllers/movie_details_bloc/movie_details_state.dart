part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final String movieDetailsMessage;
  final RequestState movieDetailsState;
  final MovieDetails? movieDetails;

  final String movieRecommendationMessage;
  final RequestState movieRecommendationState;
  final List<MovieRecommendation> movies;

  const MovieDetailsState({
    this.movieDetailsMessage = '',
    this.movieDetailsState = RequestState.loading,
    this.movieDetails,
    this.movieRecommendationMessage = '',
    this.movieRecommendationState = RequestState.loading,
    this.movies = const [],
  });

  MovieDetailsState copyWith({
    String? movieDetailsMessage,
    RequestState? movieDetailsState,
    MovieDetails? movieDetails,
    String? movieRecommendationMessage,
    RequestState? movieRecommendationState,
    List<MovieRecommendation>? movies,
  }) {
    return MovieDetailsState(
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetails: movieDetails ?? this.movieDetails,
      movieRecommendationMessage:
          movieRecommendationMessage ?? this.movieRecommendationMessage,
      movieRecommendationState:
          movieRecommendationState ?? this.movieRecommendationState,
      movies: movies ?? this.movies,
    );
  }

  @override
  List<Object?> get props => [
        movieDetailsMessage,
        movieDetailsState,
        movieDetails,
        movieRecommendationMessage,
        movieRecommendationState,
        movies,
      ];
}
