import 'dart:core';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'genre.dart';
import 'package:hive/hive.dart';
import 'dart:io' as io;
import 'dart:convert';

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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'originalLanguage': originalLanguage,
      'title': title,
      'overview': overview,
      'popularity': popularity,
      'posterImage': posterImage,
      'releaseDate': releaseDate.toIso8601String(), // Serialize DateTime as String
      'voteAverage': voteAverage,
      'genres': genres,
    };
  }

  static Movie fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      originalLanguage: json['originalLanguage'],
      title: json['title'],
      overview: json['overview'],
      popularity: json['popularity'],
      releaseDate: DateTime.parse(json['releaseDate']), // Deserialize DateTime from String
      voteAverage: json['voteAverage'],
      genres: List<int>.from(json['genres']), posterImage: json['posterImage'],
    );
  }

//   Future<String> urlToFile() async {
// // generate random number.
//     var rng = new Random();
// // get temporary directory of device.
//     Directory tempDir = await getTemporaryDirectory();
// // get temporary path from temporary directory.
//     String tempPath = tempDir.path;
// // create a new file in temporary path with random file name.
//     File file = new File('$tempPath'+ (rng.nextInt(100)).toString() +'.png');
// // call http.get method and pass imageUrl into it to get response.
//     http.Response response = await http.get(posterImage as Uri);
// // write bodyBytes received in response to file.
//     await file.writeAsBytes(response.bodyBytes);
// // now return the file which is created with random name in
// // temporary directory and image bytes from response is written to // that file.
//     final bytes = io.File(file.path).readAsBytesSync();
//     String img64 = base64Encode(bytes);
//
//     return img64;
//   }
}