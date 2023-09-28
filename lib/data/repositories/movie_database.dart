import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import '../models/genre.dart';
import '../models/movie.dart';

class MovieDataBase {

  late final Box<Movie> moviesBox;
  late final Box<Genre> genresBox;
  List<Genre> genres = [];
  List<Movie> movies = [];


  Future<void> initializeDataBase() async {

    Hive.registerAdapter(MovieAdapter());
    Hive.registerAdapter(GenreAdapter());

    moviesBox = await Hive.openBox<Movie>('moviesBox');
    genresBox = await Hive.openBox<Genre>('genresBox');
  }

  Future<void> saveData(List<Movie> allMovies, List<Genre> allGenres) async {

    // final dynamic moviesData = allMovies.map((movie) => movie.toJson()).toList();
    // final dynamic genresData = allGenres.map((genre) => genre.toJson()).toList();

    // for (Movie movie in allMovies) {
    //   movie.posterImage = await movie.urlToFile();
    // }

    for (Movie movie in allMovies) {
      await moviesBox.put(movie.id.toString(), movie);
    }

    for (Genre genre in allGenres) {
      await genresBox.put(genre.id.toString(), genre);
    }
  }

  // Future<void> loadFromDatabase() async {
  //
  //   print(genresBox.getAt(0));
  //   genres = genresBox.values.firstOrNull??[];
  //   print(genres);
  //   movies = moviesBox.values.firstOrNull??[];
  // }

  Future<void> loadFromDatabase() async {

    movies = [];
    genres = [];

    final loadedMovies = await moviesBox.values;
    final loadedGenres = await genresBox.values;

    for (Movie movie in loadedMovies) {
      movies.add(movie);
    }

    for(Genre genre in loadedGenres) {
      genres.add(genre);
    }
    // movies = moviesBox.get('allMovies') ?? [] as List<Movie>;
    // genres = genresBox.get('allGenres') ?? [] as List<Genre>;

    // final List<dynamic>? loadedGenresData = genresBox.get('allGenres');
    //
    // if (loadedMoviesData != null && loadedGenresData != null) {
    //   final List<Movie> loadedMovies = loadedMoviesData.map<Movie>((data) => Movie.fromJson(data as Map<String, dynamic>)).toList();
    //   final List<Genre> loadedGenres = loadedGenresData.map<Genre>((data) => Genre.fromJson(data as Map<String, dynamic>)).toList();
    //
    //   genres = loadedGenres;
    //   movies = loadedMovies;
    // } else {
    //   genres = [];
    //   movies = [];
    // }
  }
}
// class MovieDataBase {
//
//   late final Box<List<Movie>> moviesBox;
//   late final Box<List<Genre>> genresBox;
//   List<Genre> genres = [];
//   List<Movie> movies = [];
//
//
//   Future<void> initializeDataBase() async {
//
//     Hive.registerAdapter(MovieAdapter());
//     Hive.registerAdapter(GenreAdapter());
//
//     moviesBox = await Hive.openBox<List<Movie>>('moviesBox');
//     genresBox = await Hive.openBox<List<Genre>>('genresBox');
//   }
//
//   Future<void> saveData(List<Movie> allMovies, List<Genre> allGenres) async {
//
//     // final dynamic moviesData = allMovies.map((movie) => movie.toJson()).toList();
//     // final dynamic genresData = allGenres.map((genre) => genre.toJson()).toList();
//
//     // for (Movie movie in allMovies) {
//     //   movie.posterImage = await movie.urlToFile();
//     // }
//
//     await moviesBox.put('allMovies', allMovies);
//
//
//     await genresBox.put('allGenres', allGenres);
//
//   }
//
//   // Future<void> loadFromDatabase() async {
//   //
//   //   print(genresBox.getAt(0));
//   //   genres = genresBox.values.firstOrNull??[];
//   //   print(genres);
//   //   movies = moviesBox.values.firstOrNull??[];
//   // }
//
//   Future<void> loadFromDatabase() async {
//     movies = moviesBox.get('allMovies') ?? [] as List<Movie>;
//     genres = genresBox.get('allGenres') ?? [] as List<Genre>;
//
//     // final List<dynamic>? loadedGenresData = genresBox.get('allGenres');
//     //
//     // if (loadedMoviesData != null && loadedGenresData != null) {
//     //   final List<Movie> loadedMovies = loadedMoviesData.map<Movie>((data) => Movie.fromJson(data as Map<String, dynamic>)).toList();
//     //   final List<Genre> loadedGenres = loadedGenresData.map<Genre>((data) => Genre.fromJson(data as Map<String, dynamic>)).toList();
//     //
//     //   genres = loadedGenres;
//     //   movies = loadedMovies;
//     // } else {
//     //   genres = [];
//     //   movies = [];
//     // }
//   }
// }

// class MovieDataBase {
//
//   late final Box<List<dynamic>> moviesBox;
//   late final Box<List<dynamic>> genresBox;
//   List<Genre> genres = [];
//   List<Movie> movies = [];
//
//
//   Future<void> initializeDataBase() async {
//
//     Hive.registerAdapter(MovieAdapter());
//     Hive.registerAdapter(GenreAdapter());
//
//     moviesBox = await Hive.openBox<List<dynamic>>('moviesBox');
//     genresBox = await Hive.openBox<List<dynamic>>('genresBox');
//   }
//
//   Future<void> saveData(List<Movie> allMovies, List<Genre> allGenres) async {
//
//     final dynamic moviesData = allMovies.map((movie) => movie.toJson()).toList();
//     final dynamic genresData = allGenres.map((genre) => genre.toJson()).toList();
//
//     // for (Movie movie in allMovies) {
//     //   movie.posterImage = await movie.urlToFile();
//     // }
//
//     await moviesBox.put('allMovies', moviesData);
//
//
//     await genresBox.put('allGenres', genresData);
//
//   }
//
//   // Future<void> loadFromDatabase() async {
//   //
//   //   print(genresBox.getAt(0));
//   //   genres = genresBox.values.firstOrNull??[];
//   //   print(genres);
//   //   movies = moviesBox.values.firstOrNull??[];
//   // }
//
//   Future<void> loadFromDatabase() async {
//     final List<dynamic>? loadedMoviesData = moviesBox.get('allMovies');
//     final List<dynamic>? loadedGenresData = genresBox.get('allGenres');
//
//     if (loadedMoviesData != null && loadedGenresData != null) {
//       final List<Movie> loadedMovies = loadedMoviesData.map<Movie>((data) => Movie.fromJson(data as Map<String, dynamic>)).toList();
//       final List<Genre> loadedGenres = loadedGenresData.map<Genre>((data) => Genre.fromJson(data as Map<String, dynamic>)).toList();
//
//       genres = loadedGenres;
//       movies = loadedMovies;
//     } else {
//       genres = [];
//       movies = [];
//     }
//   }
//   }

// Future<void> main () async {
//
//   await Hive.initFlutter();
//   Hive.registerAdapter(MovieAdapter());
//   Hive.registerAdapter(GenreAdapter());
//
//   MovieAPI movieAPI = MovieAPI();
//   List<Genre> genres = await movieAPI.getGenres();
//   List<Movie> moovies = await movieAPI.getMovies();
//
//   MovieDataBase movieDataBase = MovieDataBase();
//   await movieDataBase.createDataBase();
//   await movieDataBase.fillDataBase(moovies, genres);
// }