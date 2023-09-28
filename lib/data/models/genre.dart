import 'dart:core';
import 'package:hive/hive.dart';


part 'genre.g.dart';

@HiveType(typeId: 1)
class Genre {

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  Genre({required this.id, required this.name});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  static Genre fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }
}