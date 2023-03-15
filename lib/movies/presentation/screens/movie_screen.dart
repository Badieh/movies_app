import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/presentation/controllers/movie_bloc.dart';
import 'package:movies_app/movies/presentation/controllers/movie_events.dart';
import 'package:movies_app/movies/presentation/controllers/movie_states.dart';
import 'package:movies_app/core/services/service_locator.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc(sl())..add(GetNowPlayingEvent()),
      child: BlocBuilder<MovieBloc, MovieStates>(
        builder: (context, state) {
          return Scaffold();
        },
      ),
    );
  }
}
