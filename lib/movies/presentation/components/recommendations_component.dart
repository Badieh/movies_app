import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/constance.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/presentation/components/loading_component.dart';
import 'package:movies_app/movies/presentation/controllers/movie_details_bloc/movie_details_bloc.dart';
import 'package:shimmer/shimmer.dart';

class RecommendationsComponent extends StatelessWidget {
  const RecommendationsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      // buildWhen: (previous, current) =>
      //     previous.movieRecommendationState != current.movieRecommendationState,
      builder: (context, state) {
        switch (state.movieRecommendationState) {
          case RequestState.loading:
            return const LoadingComponent();
          case RequestState.loaded:
            return SliverPadding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final recommendation = state.movies[index];
                    return FadeInUp(
                      from: 20,
                      duration: const Duration(milliseconds: 500),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4.0)),
                        child: CachedNetworkImage(
                          imageUrl: AppConstance.imageUrl(
                              recommendation.backdropPath),
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
                          height: 180.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  childCount: state.movies.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: 0.7,
                  crossAxisCount: 3,
                ),
              ),
            );
          case RequestState.error:
            return Center(child: Text(state.movieRecommendationMessage));
        }
      },
    );
  }
}
