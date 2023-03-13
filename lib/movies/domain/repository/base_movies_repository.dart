import 'package:dartz/dartz.dart';
import 'package:movies_app/core/Errors/failure.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';

abstract class BaseMoviesRepository {
  Future<Either<ServerFailure, List<Movie>>> getNowPlaying();
  Future<Either<ServerFailure, List<Movie>>> getPopularMovies();
  Future<Either<ServerFailure, List<Movie>>> getTopRatedMovies();
}
