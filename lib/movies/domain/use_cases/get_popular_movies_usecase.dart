import 'package:dartz/dartz.dart';
import 'package:movies_app/core/Errors/failure.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetPopularMoviesUseCase {
  final BaseMoviesRepository _baseMoviesRepository;

  GetPopularMoviesUseCase(this._baseMoviesRepository);

  Future<Either<ServerFailure, List<Movie>>> execute() async {
    return await _baseMoviesRepository.getPopularMovies();
  }
}
