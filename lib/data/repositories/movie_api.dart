import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;
import 'package:movie_app/constants/api.dart';

import '../models/genre.dart';
import '../models/movie.dart';

class MovieAPI {
  final client = http.Client();

  Future<List<Movie>> getMovies() async {
    List<Movie> movies = [];
    for (int i = 1; i < ApiConstants.numberOfPages; i++) {
      dynamic data =
          await fetchData(urlString: ApiConstants.moviesURL, pageNumber: i);

      if (data['results'] != null) {
        List<dynamic> movieList = data['results'];

        for (var movieData in movieList) {
          String poster =
              ApiConstants.posterURL + (movieData['poster_path'] ?? '');
          movies.add(Movie(
            id: movieData['id'] ?? 0,
            originalLanguage: movieData['original_language'] ?? 'Unknown',
            title: movieData['title'] ?? 'Unknown',
            overview: movieData['overview'] ?? 'Unknown',
            popularity: (movieData['popularity'] as num?)?.toDouble() ?? 0.0,
            posterImage: poster,
            releaseDate:
                DateTime.parse(movieData['release_date'] ?? '0000-00-00'),
            voteAverage: (movieData['vote_average'] as num?)?.toDouble() ?? 0.0,
            genres: (movieData['genre_ids'] as List<dynamic>).cast<int>(),
          ));
        }
      }
    }
    return movies;
  }

  Future<List<Genre>> getGenres() async {
    List<Genre> genres = [];
    dynamic data = await fetchData(urlString: ApiConstants.genresURL);
    if (data['genres'] != null) {
      List<dynamic> genreList = data['genres'];

      for (var genreData in genreList) {
        genres.add(Genre(
          id: genreData['id'],
          name: genreData['name'],
        ));
      }
    }
    return genres;
  }

  Future<dynamic> fetchData(
      {required String urlString, int pageNumber = 0}) async {
    Uri url;

    if (pageNumber == 0) {
      url = Uri.parse(urlString);
    } else {
      url = Uri.parse(urlString + pageNumber.toString());
    }

    final response = await client.get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      throw response.statusCode;
    }
  }
}
