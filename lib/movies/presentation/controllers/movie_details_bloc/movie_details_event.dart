part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
  @override
  List<Object> get props => [];
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final String id;

  const GetMovieDetailsEvent(this.id);
}

class GetMovieRecommendationsEvent extends MovieDetailsEvent {
  final String id;

  const GetMovieRecommendationsEvent(this.id);
}
