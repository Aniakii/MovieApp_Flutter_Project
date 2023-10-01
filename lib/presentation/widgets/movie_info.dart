import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../data/models/movie.dart';

class MovieInfo extends StatelessWidget {
  const MovieInfo(this.selectedMovie);

  final Movie selectedMovie;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            selectedMovie.title,
            style: const TextStyle(
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    S.of(context)!.moviePopularity,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(selectedMovie.popularity.toString()),
                ],
              ),
              Column(
                children: [
                  Text(
                    S.of(context)!.movieVoteRate,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        selectedMovie.voteAverage.toString(),
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20.0,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    S.of(context)!.movieReleaseDate,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    selectedMovie.releaseDate
                        .toLocal()
                        .toString()
                        .split(' ')[0],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            S.of(context)!.movieGenre,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            selectedMovie.stringGenres,
            softWrap: true,
            maxLines: 3,
          ),
          const SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              S.of(context)!.movieOverview,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            selectedMovie.overview,
            softWrap: true,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
