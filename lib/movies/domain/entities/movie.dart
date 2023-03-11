class Movie {
  int id;
  String backgroundImage;
  String title;
  String overview;
  List<int> genreIds;
  double voteAverage;

  Movie(
      {required this.id,
      required this.backgroundImage,
      required this.title,
      required this.overview,
      required this.genreIds,
      required this.voteAverage});
}
