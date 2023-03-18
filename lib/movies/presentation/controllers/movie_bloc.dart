import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecases/base_use_cases.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/use_cases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/use_cases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/use_cases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controllers/movie_events.dart';
import 'package:movies_app/movies/presentation/controllers/movie_states.dart';

class MovieBloc extends Bloc<MovieEvents, MovieState> {
  GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  GetPopularMoviesUseCase getPopularMoviesUseCase;
  GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MovieBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MovieState()) {
    on<GetNowPlayingEvent>(_getNowPlayingMovies);

    on<GetPopularEvent>(_getPopularMovies);

    on<GetTopRatedEvent>(_getTopRatedMovies);
  }

  Future<FutureOr<void>> _getNowPlayingMovies(
      GetNowPlayingEvent event, Emitter<MovieState> emit) async {
    //print(state);

    final result = await getNowPlayingMoviesUseCase(const NoParameter());

    result.fold(
        (l) => emit(state.copyWith(
            nowPlayingState: RequestState.error, nowPlayingMessage: l.message)),
        (r) => emit(state.copyWith(
              nowPlayingMovies: r,
              nowPlayingState: RequestState.loaded,
            )));
    //print(state.nowPlayingState);
  }

  Future<FutureOr<void>> _getPopularMovies(
      GetPopularEvent event, Emitter<MovieState> emit) async {
    //print(state);

    final result = await getPopularMoviesUseCase(const NoParameter());

    result.fold(
        (l) => emit(state.copyWith(
            popularState: RequestState.error, popularMessage: l.message)),
        (r) => emit(state.copyWith(
              popularMovies: r,
              popularState: RequestState.loaded,
            )));
    //print(state);
  }

  Future<FutureOr<void>> _getTopRatedMovies(
      GetTopRatedEvent event, Emitter<MovieState> emit) async {
    //print(state);

    final result = await getTopRatedMoviesUseCase(const NoParameter());

    result.fold(
        (l) => emit(state.copyWith(
            topRatedState: RequestState.error, topRatedMessage: l.message)),
        (r) => emit(state.copyWith(
              topRatedMovies: r,
              topRatedState: RequestState.loaded,
            )));
    //print(state);
  }
}
