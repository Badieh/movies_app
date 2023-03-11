import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String backgroundImage;
  final String title;
  final String overview;
  final List<int> genreIds;
  final double voteAverage;

  const Movie(
      {required this.id,
      required this.backgroundImage,
      required this.title,
      required this.overview,
      required this.genreIds,
      required this.voteAverage});

  @override
  List<Object?> get props =>
      [id, title, backgroundImage, overview, voteAverage];
}
