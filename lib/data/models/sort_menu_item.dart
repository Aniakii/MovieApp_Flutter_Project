import 'package:flutter/cupertino.dart';
import 'package:movie_app/constants/enums.dart';

class SortMenuItem {
  late final IconData icon;
  late final String description;
  late final SortingType sortType;

  SortMenuItem({required this.icon, required this.description, required this.sortType});
}