import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/Errors/failure.dart';
import 'package:movies_app/core/usecases/base_use_cases.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetMovieDetailsUseCase
    extends BaseUseCases<MovieDetails, MovieDetailsParameters> {
  final BaseMoviesRepository _baseMoviesRepository;

  GetMovieDetailsUseCase(this._baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(
      MovieDetailsParameters parameter) async {
    return await _baseMoviesRepository.getMovieDetails(parameter);
  }
}

class MovieDetailsParameters extends Equatable {
  final String movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object> get props => [];
}
