import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/constance.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/presentation/components/loading_component.dart';
import 'package:movies_app/movies/presentation/controllers/movie_bloc/movie_bloc.dart';
import 'package:movies_app/movies/presentation/controllers/movie_bloc/movie_states.dart';
import 'package:movies_app/movies/presentation/screens/movie_detail_screen.dart';

class NowPlayingComponent extends StatelessWidget {
  const NowPlayingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous, current) =>
          previous.nowPlayingState != current.nowPlayingState,
      builder: (context, state) {
        switch (state.nowPlayingState) {
          case RequestState.loading:
            return const LoadingComponent();
          case RequestState.loaded:
            return CarouselSlider(
              options: CarouselOptions(
                height: 400,
                viewportFraction: 1,
              ),
              items: state.nowPlayingMovies.map((e) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                MovieDetailScreen(id: e.id)));
                  },
                  child: Stack(
                    children: [
                      ShaderMask(
                        shaderCallback: (rect) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              // fromLTRB
                              Colors.black,
                              Colors.black,
                              Colors.black,
                              Colors.transparent,
                            ],
                            stops: [0, 0.3, 0.5, 1],
                          ).createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height),
                          );
                        },
                        blendMode: BlendMode.dstIn,
                        child: CachedNetworkImage(
                          height: 480.0,
                          imageUrl: AppConstance.imageUrl(e.backdropPath),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.circle,
                                    color: Colors.red,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Now playing'.toUpperCase(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 3, 10, 18),
                              child: Text(
                                e.title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          case RequestState.error:
            return Center(child: Text(state.nowPlayingMessage));
        }
      },
    );
  }
}
