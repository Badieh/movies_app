part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
  @override
  List<Object> get props => [];
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id;

  const GetMovieDetailsEvent(this.id);
}

class GetMovieRecommendationsEvent extends MovieDetailsEvent {
  final int id;

  const GetMovieRecommendationsEvent(this.id);
}
