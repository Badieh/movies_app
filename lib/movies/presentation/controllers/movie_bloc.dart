import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/use_cases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controllers/movie_events.dart';
import 'package:movies_app/movies/presentation/controllers/movie_states.dart';

class MovieBloc extends Bloc<MovieEvents, MovieStates> {
  GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  MovieBloc(this.getNowPlayingMoviesUseCase) : super(const MovieStates()) {
    on<GetNowPlayingEvent>((event, emit) async {
      print(state);

      final result = await getNowPlayingMoviesUseCase.execute();
      emit(const MovieStates(owPlayingState: RequestState.loading));
      print(state);

      result.fold(
          (l) => emit(MovieStates(
              owPlayingState: RequestState.error, message: l.message)),
          (r) => emit(MovieStates(
                nowPlayingMovies: r,
                owPlayingState: RequestState.loaded,
              )));
      print(state.owPlayingState);
    });
  }
}
