import 'package:dartz/dartz.dart';
import 'package:movies_app/core/Errors/failure.dart';
import 'package:movies_app/core/usecases/base_use_cases.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/use_cases/get_movie_details_usecase.dart';

import '../repository/base_movies_repository.dart';

class GetMovieRecommendationsUseCase extends BaseUseCases <List<Movie> ,MovieDetailsParameters >{
  final BaseMoviesRepository _baseMoviesRepository;

  GetMovieRecommendationsUseCase(this._baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(MovieDetailsParameters parameter) async {
  return await _baseMoviesRepository.getMovieRecommendations(parameter);
  }
}

