class AppConstance {
  //https://api.themoviedb.org/3/movie/now_playing?api_key=a9cbfdffecee81a9c5a7dbc65c6bf4e0

  static const apiKey = 'a9cbfdffecee81a9c5a7dbc65c6bf4e0';
  static const baseUrl = 'https://api.themoviedb.org/3';
  static const imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
  static imageUrl(String path) => '$imageBaseUrl$path';

  static const nowPlayingMoviesPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';

  static const popularMoviesPath = '$baseUrl/movie/popular?api_key=$apiKey';

  static const topRatedMoviesPath = '$baseUrl/movie/top_rated?api_key=$apiKey';

  static movieDetailsPath(String movieId) =>
      '$baseUrl/movie/$movieId?api_key=$apiKey';
  static movieRecommendationPath(String movieId) =>
      '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';
}
