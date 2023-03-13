import 'package:dio/dio.dart';
import 'package:movies_app/core/Errors/exceptions.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/core/utils/constance.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';

//https://api.themoviedb.org/3/movie/now_playing?api_key=a9cbfdffecee81a9c5a7dbc65c6bf4e0
class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(
        '${AppConstance.baseUrl}/movie/now_playing?api_key=${AppConstance.apiKey}');

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
