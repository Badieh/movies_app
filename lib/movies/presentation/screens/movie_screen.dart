import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_strings.dart';

import 'package:movies_app/movies/presentation/components/now_playing_component.dart';
import 'package:movies_app/movies/presentation/components/popular_component.dart';
import 'package:movies_app/movies/presentation/components/top_rated_component.dart';

import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/movies/presentation/controllers/movie_bloc/movie_bloc.dart';
import 'package:movies_app/movies/presentation/controllers/movie_bloc/movie_events.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MovieBloc>()
        ..add(GetNowPlayingEvent())
        ..add(GetPopularEvent())
        ..add(GetTopRatedEvent()),
      child: Scaffold(
        backgroundColor: Colors.grey.shade800,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const NowPlayingComponent(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        AppStrings.popular,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          children: const [
                            Text(
                              AppStrings.seeMore,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const PopularComponent(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        AppStrings.topRated,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          children: const [
                            Text(
                              AppStrings.seeMore,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const TopRatedComponent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
