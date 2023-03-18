import 'package:dartz/dartz.dart';
import 'package:movies_app/core/Errors/failure.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/use_cases/get_movie_details_usecase.dart';

abstract class BaseMoviesRepository {
  Future<Either<ServerFailure, List<Movie>>> getNowPlaying();
  Future<Either<ServerFailure, List<Movie>>> getPopularMovies();
  Future<Either<ServerFailure, List<Movie>>> getTopRatedMovies();

  Future<Either<ServerFailure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters);
  Future<Either<ServerFailure, List<Movie>>> getMovieRecommendations(
      MovieDetailsParameters parameter);
}
