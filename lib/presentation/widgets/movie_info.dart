import 'package:flutter/material.dart';

import '../../constants/texts.dart';
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
            style: const TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
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
                  const Text(
                    MovieDesc.moviePopularity,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(selectedMovie.popularity.toString()),
                ],
              ),
              Column(children: [
                const Text(
                  MovieDesc.movieVoteRate,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(children: [
                  Text(selectedMovie.voteAverage.toString()),
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 20.0,
                  ),
                ]),
              ]),
              Column(
                children: [
                  const Text(
                    MovieDesc.movieReleaseDate,
                    style: TextStyle(fontWeight: FontWeight.bold),
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
          const Text(
            MovieDesc.movieGenre,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            selectedMovie.stringGenres,
            softWrap: true,
            maxLines: 3,
          ),
          const SizedBox(
            height: 15.0,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(MovieDesc.movieOverview,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                textAlign: TextAlign.left),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(selectedMovie.overview,
              softWrap: true,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18.0)),
        ],
      ),
    );
  }
}
