import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetTopRatedMoviesUseCase {
  final BaseMoviesRepository _baseMoviesRepository;

  GetTopRatedMoviesUseCase(this._baseMoviesRepository);

  Future<List<Movie>> execute() async {
    return await _baseMoviesRepository.getTopRatedMovies();
  }
}