import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_teca/features/movies/domain/entities/movie.dart';

import '../../../../core/constants/constants.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({
    Key? key,
    this.movie,
  }) : super(key: key);

  final MovieEntity? movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 8, left: 8, bottom: 8),
      child: Align(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border))),
                Expanded(flex: 6, child: Text(movie!.title!)),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: CachedNetworkImage(
                imageUrl: "$imageUrl${movie!.poster_path}",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<MovieEntity?>('movie', movie));
  }
}
