import 'package:equatable/equatable.dart';

abstract class MovieEvents extends Equatable {
  const MovieEvents();

  @override
  List<Object> get props => [];
}

class GetNowPlayingEvent extends MovieEvents {}

class GetPopularEvent extends MovieEvents {}

class GetTopRatedEvent extends MovieEvents {}
