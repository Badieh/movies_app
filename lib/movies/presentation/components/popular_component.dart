import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/constance.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/presentation/components/loading_component.dart';
import 'package:movies_app/movies/presentation/controllers/movie_bloc/movie_bloc.dart';
import 'package:movies_app/movies/presentation/controllers/movie_bloc/movie_states.dart';

import 'package:shimmer/shimmer.dart';

class PopularComponent extends StatelessWidget {
  const PopularComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous, current) =>
          previous.popularState != current.popularState,
      builder: (context, state) {
        switch (state.popularState) {
          case RequestState.loading:
            return const LoadingComponent();
          case RequestState.loaded:
            return Container(
              height: 170,
              padding: EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () {
                  print("test");
                },
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: AppConstance.imageUrl(
                                state.popularMovies[index].backdropPath),
                            width: 120,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 8,
                        ),
                    itemCount: state.popularMovies.length),
              ),
            );
          case RequestState.error:
            return Center(child: Text(state.nowPlayingMessage));
        }
      },
    );
  }
}
