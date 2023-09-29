import 'dart:core';
import 'package:hive/hive.dart';
import 'genre.dart';


part 'movie.g.dart';


@HiveType(typeId: 0)
class Movie extends HiveObject {

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String originalLanguage;

  @HiveField(2)
  final String title;

  @HiveField(3)
  final String overview;

  @HiveField(4)
  final double popularity;

  @HiveField(5)
  String posterImage;

  @HiveField(6)
  final DateTime releaseDate;

  @HiveField(7)
  final double voteAverage;

  @HiveField(8)
  final List<int> genres;

  @HiveField(9)
  late final String stringGenres;

  Movie({required this.id, required this.originalLanguage, required this.title, required this.overview, required this.popularity, required this.releaseDate, required this.voteAverage, required this.posterImage, required this.genres});

  void genresAsString(List<Genre> allGenres) {
    String tempGenres = '';
    if (genres.isEmpty)
      {
        stringGenres = '';
        return;
      }
    for (Genre genre in allGenres) {
      if (genres.contains(genre.id)){
        tempGenres += '${genre.name}, ';
    }
    }
    stringGenres = tempGenres.substring(0,tempGenres.length - 2);
  }
}