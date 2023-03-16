import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/constance.dart';
import 'package:movies_app/core/utils/dummy.dart';

class NowPlayingComponent extends StatelessWidget {
  const NowPlayingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
        viewportFraction: 1,
      ),
      items: moviesList.map((e) {
        return GestureDetector(
          onTap: () {
            print('test');
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
                    Rect.fromLTRB(
                        0, 0, rect.width, rect.height),
                  );
                },
                blendMode: BlendMode.dstIn,
                child: CachedNetworkImage(
                  height: 500.0,
                  imageUrl:
                  AppConstance.imageUrl(e.backdropPath),
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
                        mainAxisAlignment:
                        MainAxisAlignment.center,
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
                                color: Colors.white,
                                fontSize: 22),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        e.title,
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
  }
}
