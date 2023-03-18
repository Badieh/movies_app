import 'package:dartz/dartz.dart';
import 'package:movies_app/core/Errors/failure.dart';
import 'package:movies_app/core/usecases/base_use_cases.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetPopularMoviesUseCase extends BaseUseCases{
  final BaseMoviesRepository _baseMoviesRepository;

  GetPopularMoviesUseCase(this._baseMoviesRepository);



  @override
  Future<Either<Failure, dynamic>> call() async {
    return await _baseMoviesRepository.getPopularMovies();

  }
}
