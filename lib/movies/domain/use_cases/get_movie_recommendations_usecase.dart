import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/Errors/failure.dart';
import 'package:movies_app/core/usecases/base_use_cases.dart';
import 'package:movies_app/movies/domain/entities/movie_recommendation.dart';

import '../repository/base_movies_repository.dart';

class GetMovieRecommendationsUseCase extends BaseUseCases<
    List<MovieRecommendation>, MovieRecommendationsParameters> {
  final BaseMoviesRepository _baseMoviesRepository;

  GetMovieRecommendationsUseCase(this._baseMoviesRepository);

  @override
  Future<Either<Failure, List<MovieRecommendation>>> call(
      MovieRecommendationsParameters parameter) async {
    return await _baseMoviesRepository.getMovieRecommendations(parameter);
  }
}

class MovieRecommendationsParameters extends Equatable {
  final int movieId;

  const MovieRecommendationsParameters(this.movieId);

  @override
  List<Object> get props => [id];
}
