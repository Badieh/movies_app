import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/movie_recommendation.dart';
import 'package:movies_app/movies/domain/use_cases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/use_cases/get_movie_recommendations_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetMovieRecommendationsUseCase getMovieRecommendationsUseCase;

  MovieDetailsBloc(
      this.getMovieDetailsUseCase, this.getMovieRecommendationsUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationsEvent>(_getMovieRecommendations);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.id));

    result.fold(
        (l) => emit(state.copyWith(
            movieDetailsMessage: l.message,
            movieDetailsState: RequestState.error)),
        (r) => emit(state.copyWith(
            movieDetailsState: RequestState.loaded, movieDetails: r)));
  }

  FutureOr<void> _getMovieRecommendations(GetMovieRecommendationsEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getMovieRecommendationsUseCase(
        MovieRecommendationsParameters(event.id));

    result.fold(
        (l) => emit(state.copyWith(
            movieRecommendationMessage: l.message,
            movieRecommendationState: RequestState.error)),
        (r) => emit(state.copyWith(
            movieRecommendationState: RequestState.loaded, movies: r)));
  }
}
