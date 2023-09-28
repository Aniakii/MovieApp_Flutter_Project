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


    for (Movie movie in allMovies) {
      await moviesBox.put(movie.id.toString(), movie);
    }

    for (Genre genre in allGenres) {
      await genresBox.put(genre.id.toString(), genre);
    }
  }

  void loadFromDatabase() {

    movies = [];
    genres = [];

    final loadedMovies = moviesBox.values;
    final loadedGenres = genresBox.values;

    for (Movie movie in loadedMovies) {
      movies.add(movie);
    }

    for(Genre genre in loadedGenres) {
      genres.add(genre);
    }
  }
}