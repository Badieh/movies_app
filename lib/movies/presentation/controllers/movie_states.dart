import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';

class MovieStates extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState owPlayingState;
  final String message;

  const MovieStates(
      {this.nowPlayingMovies = const [],
      this.owPlayingState = RequestState.loading,
      this.message = ''});

  @override
  List<Object?> get props => [nowPlayingMovies, owPlayingState, message];
}
