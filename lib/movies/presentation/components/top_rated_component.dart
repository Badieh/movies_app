import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/constance.dart';
import 'package:movies_app/core/utils/dummy.dart';
import 'package:shimmer/shimmer.dart';

class TopRatedComponent extends StatelessWidget {
  const TopRatedComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    imageUrl:
                        AppConstance.imageUrl(moviesList[index].backdropPath),
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
            itemCount: moviesList.length),
      ),
    );
  }
}
