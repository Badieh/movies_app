import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movie_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/use_cases/get_now_playing_movies_usecase.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    // useCase
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));

    // repository
    sl.registerLazySingleton<BaseMoviesRepository>(() => MovieRepository(sl()));

    // data source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
  }
}
