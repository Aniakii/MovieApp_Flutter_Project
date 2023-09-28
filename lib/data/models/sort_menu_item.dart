import 'package:flutter/cupertino.dart';
import 'package:movie_app/constants/enums.dart';

class SortMenuItem {
  final IconData icon;
  final String description;
  final SortingType sortType;

  const SortMenuItem({required this.icon, required this.description, required this.sortType});
}