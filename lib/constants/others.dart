import 'package:flutter/material.dart';
import '../data/models/sort_menu_item.dart';
import 'texts.dart';
import 'color_palette.dart';
import 'enums.dart';


BoxDecoration cardDecoration = BoxDecoration(
  color: AppColors.grey,
  borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(15.0),
    topRight: Radius.circular(15.0),
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.5),
      spreadRadius: 7,
      blurRadius: 5,
      offset: const Offset(5, 5),
    ),
  ],
);

InputDecoration textFieldDecoration = InputDecoration(
  hintText: AppTexts.searchHintText,
  filled: true,
  fillColor: Colors.white.withOpacity(0.5),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: BorderSide.none,
  ),
);

const List<SortMenuItem> sortMenuItems = [
  SortMenuItem(icon: Icons.sort_by_alpha, description: 'From A to Z', sortType: SortingType.fromAtoZ),
  SortMenuItem(icon: Icons.sort_by_alpha, description: 'From Z to A', sortType: SortingType.fromZtoA),
  SortMenuItem(icon: Icons.star_border, description: 'Worst rate', sortType: SortingType.worstRate),
  SortMenuItem(icon: Icons.star, description: 'Best rate', sortType: SortingType.bestRate),
  SortMenuItem(icon: Icons.expand_less, description: 'Most popular', sortType: SortingType.mostPopular),
  SortMenuItem(icon: Icons.expand_more, description: 'Least popular', sortType: SortingType.leastPopular),
  SortMenuItem(icon: Icons.restart_alt, description: 'Default', sortType: SortingType.defaultSorting),
];