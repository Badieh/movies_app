
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/service_locator.dart';

import 'package:movies_app/movies/presentation/components/details_component.dart';
import 'package:movies_app/movies/presentation/controllers/movie_details_bloc/movie_details_bloc.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<MovieDetailsBloc>()
          ..add(GetMovieDetailsEvent(id))
          ..add(GetMovieRecommendationsEvent(id)),
        child: const DetailsComponent());
  }
}
