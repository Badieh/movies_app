import 'package:dartz/dartz.dart';
import 'package:movies_app/core/failure/failure.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetTopRatedMoviesUseCase {
  final BaseMoviesRepository _baseMoviesRepository;

  GetTopRatedMoviesUseCase(this._baseMoviesRepository);

  Future<Either<ServerFailure, List<Movie>>> execute() async {
    return await _baseMoviesRepository.getTopRatedMovies();
  }
}
